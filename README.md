# TLUI

Easy Way For Layout Constraints

###### Center In Super View
```swift

let sampleView = UIView()
sampleView.translatesAutoresizingMaskIntoConstraints = false
sampleView.backgroundColor = .red

view.addSubview(sampleView)
sampleView.centerInSuperView(size: .init(width: 50, height: 50))

```
###### Add Top / Left Anchor
```swift

let sampleView = UIView()
sampleView.translatesAutoresizingMaskIntoConstraints = false
sampleView.backgroundColor = .red

view.addSubview(sampleView)

sampleView.addConstraints(leadingAnchorTuple: (view.leadingAnchor, 100), topAnchorTuple: (view.topAnchor, 100))
sampleView.addHeightConstraint(equalToConstant: 50)
sampleView.addWidthConstraint(equalToConstant: 50)

```
###### Add Same Anchor With Other Views
```swift

let sampleView = UIView()
sampleView.translatesAutoresizingMaskIntoConstraints = false
sampleView.backgroundColor = .red
let sampleView2 = UIView()
sampleView2.translatesAutoresizingMaskIntoConstraints = false
sampleView2.backgroundColor = .blue

view.addSubview(sampleView)
view.addSubview(sampleView2)

sampleView.centerInSuperView(size: .init(width: 50, height: 50))
sampleView2.addConstraints(trailingAnchorTuple: (sampleView.leadingAnchor, 0) ,bottomAnchorTuple: (sampleView.topAnchor, 0))
sampleView2.addWidthConstraint(equalTo: sampleView.widthAnchor)
sampleView2.addHeightConstraint(equalTo: sampleView.heightAnchor)

```
