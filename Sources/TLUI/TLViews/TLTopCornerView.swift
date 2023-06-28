import UIKit

open class TLTopCornerView: UIView {
    private var corner: CGFloat = 0.0

    public init(backgroundColor: UIColor, corner: CGFloat) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.corner = corner
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: corner)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
