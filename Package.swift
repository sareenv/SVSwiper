// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SVSwiper",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "SVSwiper",
            targets: ["SVSwiper"]),
    ],
    dependencies: [
        // No external dependencies
    ],
    targets: [
        .target(
            name: "SVSwiper",
            dependencies: [],
            path: "SVSwiper/Classes",
            exclude: [".gitkeep"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
