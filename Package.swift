// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AzureDevOpsKit",
    products: [
        .library(
            name: "AzureDevOpsKit",
            targets: [
                "AzureDevOpsBuilds",
                "AzureDevOpsCore",
                "AzureDevOpsPipelines",
                "AzureDevOpsShared"
            ]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AzureDevOpsBuilds",
            dependencies: ["AzureDevOpsClient", "AzureDevOpsShared", "AzureDevOpsCore"]
        ),
        .target(
            name: "AzureDevOpsCore",
            dependencies: ["AzureDevOpsClient", "AzureDevOpsShared"]
        ),
        .target(
            name: "AzureDevOpsPipelines",
            dependencies: ["AzureDevOpsClient", "AzureDevOpsShared", "AzureDevOpsCore"]
        ),
        .target(
            name: "AzureDevOpsShared",
            dependencies: []
        ),

        .target(
            name: "AzureDevOpsClient",
            dependencies: ["AzureDevOpsShared"]
        )
    ]
)
