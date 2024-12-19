// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "i2cBuffers",
    products: [
        .library(
            name: "i2cBuffers",
            targets: ["i2cBuffers"]),
    ],
    dependencies: [
        .package(url: "https://github.com/microswift-packages/i2c", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "i2cBuffers",
            dependencies: [],
            path: ".",
            sources: ["i2c-buffers.swift"]),
    ]
)
