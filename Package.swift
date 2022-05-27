// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDBSwift",
    platforms: [
        .iOS(.v9),
        .tvOS(.v10),
        .macOS(.v10_15),
    ],
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
