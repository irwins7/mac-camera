// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MacCamera",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "MacCamera",
            targets: ["MacCameraPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "MacCameraPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/MacCameraPlugin"),
        .testTarget(
            name: "MacCameraPluginTests",
            dependencies: ["MacCameraPlugin"],
            path: "ios/Tests/MacCameraPluginTests")
    ]
)