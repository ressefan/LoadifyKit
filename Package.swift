// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoadifyKit",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        .library(name: "LoadifyKit", targets: ["LoadifyKit"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "LoadifyKit", dependencies: [], path: "Sources/LoadifyKit/LoaderView"),
    ]
)
