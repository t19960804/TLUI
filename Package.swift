// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TLUI", // package 的名稱 。
    platforms: [.iOS(.v11)], // package 預設支援多個平台，我們可透過參數 platforms 限制它支援的系統版本。 [.iOS(.v11)] 表示在 iOS 要 11 以上才能使用 package。值得注意的，沒寫在 [ ] 裡不代表不支援，因此 macOS App 也能使用 package。
    products: [ // package 生成的產品。我們主要目的是產生讓 App 使用的 library，所以傳入 .library(name: "TLUI", targets: ["TLUI"])。library 的名稱是 TLUI，它包含的 target 也叫 TLUI。
        .library(
            name: "TLUI",
            targets: ["TLUI"]),
    ],
    dependencies: [
        // package 的程式也可以使用其它 package。若有用到其它 package，可在 dependencies 欄位設定網路上 package 的網址或本機 package 的路經。
    ],
    targets: [
        // package 產生的 module。我們待會寫的程式將編譯成 TLUI Target。
        .target(
            name: "TLUI",
            dependencies: [],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS]))
            ]),
        .testTarget(
            name: "TLUITests",
            dependencies: ["TLUI"]),
    ]
)
