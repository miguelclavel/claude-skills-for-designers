#!/bin/sh
# Usage: scan.sh <folder> [every-nth-frame]
# Reads every image, every frame (or every nth) of every GIF and video, and
# every PDF in a folder, and prints anything that looks like an email address,
# a phone number, or a secret. Needs macOS (Vision, PDFKit) and ffmpeg.
set -e
DIR="${1:?give a folder}"; NTH="${2:-1}"
HERE="$(cd "$(dirname "$0")" && pwd)"; WORK="$(mktemp -d)"
[ -x "$HERE/ocr" ] || swiftc -O "$HERE/ocr.swift" -o "$HERE/ocr"
[ -x "$HERE/pdftext" ] || swiftc -O "$HERE/pdftext.swift" -o "$HERE/pdftext"
PATTERN='[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}|\(?[0-9]{3}\)?[ .-][0-9]{3}[ .-][0-9]{4}|sk-[A-Za-z0-9]{10,}|ghp_[A-Za-z0-9]{10,}|AKIA[A-Z0-9]{12,}|password'
find "$DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) -print0 | xargs -0 "$HERE/ocr" > "$WORK/text.tsv" 2>/dev/null || true
find "$DIR" -type f \( -iname '*.gif' -o -iname '*.mp4' -o -iname '*.mov' -o -iname '*.webm' \) | while IFS= read -r f; do
  out="$WORK/$(echo "$f" | tr '/ ' '__')"; mkdir -p "$out"
  ffmpeg -v error -i "$f" -vf "select='not(mod(n\,$NTH))'" -vsync vfr "$out/%05d.png"
  "$HERE/ocr" "$out"/*.png | sed "s|^$out/|$f frame |" >> "$WORK/text.tsv" || true
done
find "$DIR" -type f -iname '*.pdf' -print0 | xargs -0 "$HERE/pdftext" >> "$WORK/text.tsv" 2>/dev/null || true
if grep -iEo "^[^	]*	.*" "$WORK/text.tsv" | grep -iE "$PATTERN" > "$WORK/hits.tsv"; then
  echo "Possible private details found:"; while IFS="	" read -r file text; do echo "- $file: $(echo "$text" | grep -ioE "$PATTERN" | sort -u | tr '\n' ' ')"; done < "$WORK/hits.tsv"; exit 1
else echo "Clean: no email addresses, phone numbers or secrets found in $(wc -l < "$WORK/text.tsv" | tr -d ' ') images, frames and PDFs."; fi
