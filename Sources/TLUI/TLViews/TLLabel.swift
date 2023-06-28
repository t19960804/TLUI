import UIKit

open class TLLabel: UILabel {
    public init(text: String?, textColor: UIColor, font: UIFont, textAlignment: NSTextAlignment = .natural, numberOfLines: Int = 1) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
    
    public func setAttributedText(attributedStrings: [NSAttributedString]) {
        let content = NSMutableAttributedString()
        for string in attributedStrings {
            content.append(string)
        }
        self.attributedText = content
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
