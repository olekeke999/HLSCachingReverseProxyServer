// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "HLSCachingReverseProxyServer",
    platforms: [
        .macOS(.v10_11),
        .iOS(.v12),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "HLSCachingReverseProxyServer",
            targets: ["HLSCachingReverseProxyServer"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "9.0.0")),
        .package(url: "https://github.com/devxoul/SafeCollection.git", .upToNextMajor(from: "3.1.0")),
        .package(url: "https://github.com/pinterest/PINCache", from: "3.0.4"),
        .package(url: "https://github.com/readium/GCDWebServer", from: "4.0.1"),
    ],
    targets: [
        .target(
            name: "HLSCachingReverseProxyServer",
            dependencies: [
                .product(name: "PINCache", package: "PINCache"),
                .product(name: "ReadiumGCDWebServer", package: "GCDWebServer"),
            ]
        ),
        .testTarget(
            name: "HLSCachingReverseProxyServerTests",
            dependencies: [
                "HLSCachingReverseProxyServer",
                "Nimble",
                "SafeCollection",
                .product(name: "PINCache", package: "PINCache"),
                .product(name: "ReadiumGCDWebServer", package: "GCDWebServer"),
            ]
        ),
    ]
)