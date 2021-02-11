// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AzureDevOpsKit",
    products: [
        .library(name: "AzureDevOpsKit", targets: ["AzureDevOpsKit"])
    ],
    dependencies: [],
    targets: [
        .target(name: "AzureDevOpsKit", dependencies: []),
        .testTarget(name: "AzureDevOpsKitTests", dependencies: ["AzureDevOpsKit"])
    ]
)
