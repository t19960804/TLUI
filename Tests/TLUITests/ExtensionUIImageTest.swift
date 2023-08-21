import XCTest

final class ExtensionUIImageTest: XCTestCase {
    var image: UIImage!
    
    override func setUp() {
        super.setUp()
        let rect = CGRect(origin: .zero, size: .init(width: 10, height: 10))
        UIGraphicsBeginImageContextWithOptions(.init(width: 10, height: 10), false, 0.0)
        UIColor.red.setFill()
        UIRectFill(rect)
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
    }
    
    override func tearDown() {
        super.tearDown()
        image = nil
    }
    
    func testToAttributedString() {
        let bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        let attributedString = image.toAttributedString(bounds: bounds)
        
        guard let attachment = attributedString.attribute(NSAttributedString.Key.attachment, at: 0, effectiveRange: nil) as? NSTextAttachment else {
            XCTFail("Attachment not found in attributed string")
            return
        }
        
        XCTAssertEqual(attachment.image, image)
        XCTAssertEqual(attachment.bounds, bounds)
    }
}
