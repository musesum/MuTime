// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MuTime",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MuTime",
            targets: ["MuTime"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MuTime",
            dependencies: []),
        .testTarget(
            name: "MuTimeTests",
            dependencies: ["MuTime"]),
    ]
)
