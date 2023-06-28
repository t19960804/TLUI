import UIKit

extension String {
    public func toAttributedString(color: UIColor, font: UIFont, alignment: NSTextAlignment = .left, underlineColor: UIColor = .clear) -> NSAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = alignment
        var attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font: font,
            .paragraphStyle: paragraph
        ]
        if underlineColor != .clear {
            attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
            attributes[.underlineColor] = underlineColor.cgColor
        }
        return NSAttributedString(string: self, attributes: attributes)
    }
}
