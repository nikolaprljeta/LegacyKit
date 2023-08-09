# LegacyKit

## Installation

To install this package, import `https://github.com/nikolaprljeta/LegacyKit` into SPM.

## Usage example

### Importing Images

Declare a toggle i.e.
```swift
@State private var showingImagePicker = false
```

Toggle your toggle to initiate a picker in the trailing closure of a sheet.
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
Button("Save", action: save)
```

### Scanning QR Codes
Heard you like dependencies, so I put a dependency in your dependency. [Take it away](https://github.com/twostraws/CodeScanner), [Hudson](https://twitter.com/twostraws?s=21&t=ncXijBxwxCEB_4qcaiQoLA). 

## Credits
CodeScanner was made by [Paul Hudson](https://twitter.com/twostraws?s=21&t=ncXijBxwxCEB_4qcaiQoLA), who writes amazing Swift. It’s available under the MIT license, which permits commercial use, modification, distribution, and private use.

## License
[MIT License](https://choosealicense.com/licenses/mit/)
