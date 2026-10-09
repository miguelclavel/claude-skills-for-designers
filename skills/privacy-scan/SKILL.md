---
name: privacy-scan
description: 'Scan screenshots, screen recordings, GIFs, videos and PDFs for email addresses, phone numbers and secrets before they''re published. Use before pushing images to a public repo, posting a recording, sharing a portfolio, uploading a resume, or whenever someone asks "is there anything private in these files".'
---

# Privacy scan

Code gets reviewed. Images and recordings usually don't, and they leak more: an old email in a site footer, a browser autofill popup in a screen recording, a phone number in a resume PDF. Read every pixel of text before anything goes public.

## Steps

1. **Find the media.** Every image, GIF, video and PDF that's about to be published (or the whole folder).
2. **Read all of it.** Run `scripts/scan.sh <folder>` (macOS, needs ffmpeg). It reads text in every image, every frame of every GIF and video, and every PDF, and flags email addresses, phone numbers and common secret patterns. For long videos, `scripts/scan.sh <folder> 6` reads every sixth frame first; then re-run on anything flagged at every frame.
3. **Check the hits by eye.** Text recognition misreads things ("Miguel Clavel |" can read as "@"). Open each flagged frame and confirm before acting.
4. **Fix.** For a static spot (a footer line), cover it on every frame with ffmpeg's `delogo` filter. For something that moves or pops up (an autofill menu), cut that part or don't publish the clip. For PDFs, regenerate the file without the detail rather than drawing over it.
5. **Scan again.** A fix isn't done until the scan comes back clean.
6. **If it was already published,** replace the file and remove it from the git history too (squash or rewrite, then force push), and say plainly that old links may stay cached for a while.

## Also check

- The public addresses are the ones the person wants public (a work or hello@ address, not a personal one).
- Commit metadata uses a no-reply email.
- Image metadata: photos can carry GPS location; strip it.

## Output

A list of every file and frame with a finding, what was found, and what was done about it, ending with the clean re-scan result.
