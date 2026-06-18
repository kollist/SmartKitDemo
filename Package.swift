// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SmartKitDemo",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: [
        .package(url: "https://github.com/kollist/SmartKit.git", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "SmartKitDemo",
            dependencies: [
                .product(name: "SmartKit", package: "SmartKit")
            ]
        )
    ]
)
