import UIKit

extension UIImage {
    public func toAttributedString(bounds: CGRect) -> NSAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = self
        attachment.bounds = bounds
        return NSAttributedString(attachment: attachment)
    }
}
