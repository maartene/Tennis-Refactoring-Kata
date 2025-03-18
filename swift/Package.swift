// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Tennis",
    products: [
    ],
    targets: [
        .target(name: "Tennis"),
        .testTarget(
            name: "TennisTests",
            dependencies: [
                "Tennis",
            ]
        )
    ]
)
