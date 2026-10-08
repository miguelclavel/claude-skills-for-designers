// Reads the text in images with Apple's Vision framework and prints one line
// per image: file name, a tab, then everything it could read. macOS only.
// Build once: swiftc -O ocr.swift -o ocr
import Vision
import AppKit
for path in CommandLine.arguments.dropFirst() {
  guard let img = NSImage(contentsOfFile: path), let cg = img.cgImage(forProposedRect: nil, context: nil, hints: nil) else { continue }
  let req = VNRecognizeTextRequest(); req.recognitionLevel = .accurate; req.usesLanguageCorrection = false
  try? VNImageRequestHandler(cgImage: cg).perform([req])
  let text = (req.results ?? []).compactMap { $0.topCandidates(1).first?.string }.joined(separator: " | ")
  print("\(path)\t\(text)")
}
