// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDBSwift",
    platforms: [
        .iOS(.v13),
        .tvOS(.v10),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "TMDBSwift",
            targets: ["TMDBSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin.git", from: "1.0.0"),
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
