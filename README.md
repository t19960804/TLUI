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
