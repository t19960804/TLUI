import UIKit

open class TLButton: UIButton {
    init(text: String, textColor: UIColor, font: UIFont, backgroundColor: UIColor, corner: CGFloat = 0) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = backgroundColor
        addCorner(corner)
        self.titleLabel?.font = font
    }
    
    init(backgroundColor: UIColor, corner: CGFloat = 0) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        addCorner(corner)
    }
    
    func setAttributedTitle(attributedStrings: [NSAttributedString?]) {
        let content = NSMutableAttributedString()
        for string in attributedStrings {
            if let string = string {
                content.append(string)
            }
        }
        self.setAttributedTitle(content, for: .normal)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
