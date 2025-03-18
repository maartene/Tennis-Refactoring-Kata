// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Tennis",
    products: [
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-testing.git", branch: "main"),
    ],
    targets: [
        .target(name: "Tennis"),
        .testTarget(
            name: "TennisTests",
            dependencies: [
                "Tennis",
                .product(name: "Testing", package: "swift-testing")
            ]
        )
    ]
)
