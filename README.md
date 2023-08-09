# LegacyKit

## Installation

To install this package, import `https://github.com/nikolaprljeta/LegacyKit` into SPM.

## Usage example

### Importing Images

Declare a toggle.
```swift
@State private var showingImagePicker = false
```

Toggle your toggle to initiate a picker a trailing closure of a sheet.
```swift
.sheet(isPresented: $showingImagePicker) {
    ImagePicker(image: $inputImage)
}
```

### Saving Images
Write out a save function like so.
```swift
func save() {
    guard let image = image else { return }
        
    let imageSaver = ImageSaver()
        
    imageSaver.successHandler = {
        print("Success!")
    }
        
    imageSaver.errorHandler = {
        print("Oops! \($0.localizedDescription)")
    }
        
    imageSaver.writeToPhotoAlbum(image: image)
}
```

Then call it from e.g. a button.
```swift

```

### Scanning QR Codes
First off declare a toggle.
```swift
@State private var isShowingScanner = false
```

To scan a code, write out the handleScan() function like so:
```swift
func handleScan(result: Result<ScanResult, ScanError>) {
    isShowingScanner = false
        
    switch result {
    case .success(let result):
        let details = result.string.components(separatedBy: "\n")
        guard details.count == 2 else { return }
            
        let person = People()
        person.name = details[0]
        person.eMailAddress = details[1]
        people.add(person)
    case .failure(let error):
        print("Scanning failed: \(error.localizedDescription)")
    }
}
```

Then toggle your toggle by e.g. a button tap to show the scanner sheet.
```swift
.toolbar {
    Button {
        isShowingScanner = true
    } label: {
        Label("Scan", systemImage: "qrcode.viewfinder")
    }
}
.sheet(isPresented: $isShowingScanner) {
    CodeScannerView(codeTypes: [.qr], simulatedData: "John Smith\njohnsmith@example.com", completion: handleScan)
}
```
