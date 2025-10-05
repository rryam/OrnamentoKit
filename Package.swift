// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "OrnamentoKit",
  platforms: [.visionOS(.v1)],
  products: [
    .library(name: "OrnamentoKit", targets: ["OrnamentoKit"]),
  ],
  targets: [
    .target(name: "OrnamentoKit"),
    .testTarget(name: "OrnamentoKitTests", dependencies: ["OrnamentoKit"]),
  ]
)
