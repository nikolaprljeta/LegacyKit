# LegacyKit

## Installation

To install this package, import `https://github.com/nikolaprljeta/LegacyKit` into SPM.

## Usage example

### Importing Images
To import an image, create a state private var showingImagePicker bool to toggle, then initiate the picker inside the trailing closure of a sheet.
```swift
.sheet(isPresented: $showingImagePicker) {
    ImagePicker(image: $inputImage)
}
```

### Saving Images
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

### Scanning QR Codes
To scan a code, first off write out the handleScan() function like so:
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

Then toggle a state bool (i.e. isShowingScanner) to show/hide the sheet cotaining the scanner.
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
