import UIKit

open class TLView: UIView {
    // test
    public init(backgroundColor: UIColor, corner: CGFloat = 0) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        addCorner(corner)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
