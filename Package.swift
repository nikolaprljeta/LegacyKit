// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LegacyKit",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "LegacyKit",
            targets: ["LegacyKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/twostraws/codescanner.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "LegacyKit",
            dependencies: [
                .product(name: "CodeScanner", package: "codescanner")
            ]),
        
        .testTarget(
            name: "LegacyKitTests",
            dependencies: ["LegacyKit"]),
    ]
)
