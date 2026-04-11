// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TapMindAdapter",
    platforms: [
        .iOS(.v13) // The minimum iOS version your SDK supports
    ],
    products: [
        // This is what users will see when they add the package
        .library(
            name: "TapMindAdapter",
            targets: ["TapMindAdapterTarget"])
    ],
    dependencies: [
        // Google Mobile Ads official Swift Package
        .package(
            url: "https://github.com/kishantuvoc/TapMindSDK.git",
            from: "1.2.0"
        )
    ],
    targets: [
        // 1. The actual binary framework
        .binaryTarget(
            name: "TapMindAdapterBinary",
            path: "TapMindAdapter.xcframework"
        ),
        // 2. The wrapper target that bridges your binary and Google Mobile Ads
        .target(
            name: "TapMindAdapterTarget",
            dependencies: [
                .target(name: "TapMindAdapterBinary"),
                .product(name: "TapMindSDK", package: "TapMindSDK")
            ],
            path: "Sources/TapMindAdapter" // Points to your physical folder
        )
    ]
)
