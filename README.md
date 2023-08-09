# LegacyKit

## Installation

To install this package, import `https://github.com/nikolaprljeta/LegacyKit` into SPM.

## Usage example

To import an image, create a state private var showingImagePicker bool to toggle, then initiate the picker inside the trailing closure of a sheet.
```swift
.sheet(isPresented: $showingImagePicker) {
    ImagePicker(image: $inputImage)
}
```

Call the save() function from e.g. a button.
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

To scan a QR code, write out the handlescan function like so:
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

Then toggle a isShowingScanner bool to show/hide the sheet cotaining the scanner.
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
