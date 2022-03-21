// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDBSwift",
    products: [
        .library(
            name: "TMDBSwift",
            targets: ["TMDBSwift"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "TMDBSwift",
            dependencies: []),
        .testTarget(
            name: "TMDBSwiftTests",
            dependencies: ["TMDBSwift"]),
    ]
)
