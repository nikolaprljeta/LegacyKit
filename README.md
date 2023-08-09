# LegacyKit

## Installation

To install this package, import `https://github.com/nikolaprljeta/LegacyKit` into SPM.

## Usage example

Importing an image
```swift
ImagePicker(image: $inputImage)
```

Saving an image
```swift
ImageSaver()
```

Scanning a QR code
```swift
CodeScannerView(codeTypes: [.qr], simulatedData: "name@domain.com", completion: handleScan)
```
