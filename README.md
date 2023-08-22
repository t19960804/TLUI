![](https://github.com/t19960804/TLUI/blob/main/Sources/TLUI/Resources/Banner_2.png)

![](https://img.shields.io/badge/Swift-5%2B-blue)
![](https://img.shields.io/badge/Platform-iOS-orange)
![](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-green)
![](https://img.shields.io/badge/Version-1.0.3-yellow)
![](https://img.shields.io/badge/UnitTest-92%25-yellow)

## Components

* TLButton
* TLCollectionView
* TLImageView
* TLLabel
* TLTopCornerView
* TLView

## How to use?

###### Center In Super View
```swift

let sampleView = TLView(backgroundColor: .red)
view.addSubview(sampleView)

sampleView.centerInSuperView(size: .init(width: 150, height: 150))

```
![Demo](https://github.com/t19960804/TLUI/blob/main/Sources/TLUI/Resources/Demo1.png)

###### Add Top / Left Anchor
```swift

let sampleView = TLView(backgroundColor: .red)
view.addSubview(sampleView)

sampleView.addConstraints(leadingAnchorTuple: (view.leadingAnchor, 50), topAnchorTuple: (view.topAnchor, 50))
sampleView.addHeightConstraint(equalToConstant: 150)
sampleView.addWidthConstraint(equalToConstant: 150)

```
![Demo](https://github.com/t19960804/TLUI/blob/main/Sources/TLUI/Resources/Demo2.png)
###### Add Same Anchor With Other Views
```swift

let sampleView = TLView(backgroundColor: .red)
let sampleView2 = TLView(backgroundColor: .blue)

view.addSubview(sampleView)
view.addSubview(sampleView2)

sampleView.centerInSuperView(size: .init(width: 100, height: 100))
sampleView2.addConstraints(trailingAnchorTuple: (sampleView.leadingAnchor, 0) ,bottomAnchorTuple: (sampleView.topAnchor, 0))
sampleView2.addWidthConstraint(equalTo: sampleView.widthAnchor)
sampleView2.addHeightConstraint(equalTo: sampleView.heightAnchor)

```
![Demo](https://github.com/t19960804/TLUI/blob/main/Sources/TLUI/Resources/Demo3.png)

## Installation

* Swift Package Manager

## Requirements

* iOS 13 +
* Swift 5 +
