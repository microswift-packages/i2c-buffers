// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "i2c-buffers",
    products: [
        .library(
            name: "i2c-buffers",
            targets: ["i2c-buffers"]),
    ],
    dependencies: [
        .package(url: "https://github.com/microswift-packages/i2c", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "i2c-buffers",
            dependencies: [],
            path: ".",
            sources: ["i2c-buffers.swift"]),
    ]
)
