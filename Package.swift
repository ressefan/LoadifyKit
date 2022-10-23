// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoadifyKit",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        .library(name: "LoadifyKit", targets: ["LoadifyKit"]),
    ],
    dependencies: [
        .package(url: "git@github.com:VishwaiOSDev/FontKit.git", .upToNextMinor(from: "0.0.5")),
    ],
    targets: [
        .target(name: "LoadifyKit", dependencies: [
            .product(name: "FontKit", package: "FontKit"),
        ], resources: [.process("Others/Resources")])
    ]
)
