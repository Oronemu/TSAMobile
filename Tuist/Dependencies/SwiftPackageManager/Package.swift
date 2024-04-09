// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.1"),
    ]
)