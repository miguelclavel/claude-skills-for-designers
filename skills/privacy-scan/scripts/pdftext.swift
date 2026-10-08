// Prints the text of each PDF: file name, a tab, then the text. macOS only.
// Build once: swiftc -O pdftext.swift -o pdftext
import PDFKit
for p in CommandLine.arguments.dropFirst() {
  if let d = PDFDocument(url: URL(fileURLWithPath: p)) { print("\(p)\t\((d.string ?? "").replacingOccurrences(of: "\n", with: " "))") }
}
