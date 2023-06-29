![](https://github.com/t19960804/TLUI/blob/main/Sources/TLUI/Resources/Banner_2.png)

##Components

* TLButton
* TLCollectionView
* TLImageView
* TLLabel
* TLTopCornerView
* TLView

##How to use?

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

##Requirements

* iOS 11 +
* Swift 5 +
