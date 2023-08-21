import XCTest

final class ExtensionStringTest: XCTestCase {
    func testToAttributedString() {
        let string = "Hello, World!"
        let color = UIColor.red
        let font = UIFont.systemFont(ofSize: 16)
        let alignment: NSTextAlignment = .center
        let underlineColor = UIColor.blue
        
        let attributedString = string.toAttributedString(color: color, font: font, alignment: alignment, underlineColor: underlineColor)
        
        let paragraphStyle = attributedString.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSMutableParagraphStyle
        XCTAssertEqual(paragraphStyle?.alignment, alignment)
        let attributes = attributedString.attributes(at: 0, effectiveRange: nil)
        XCTAssertEqual(attributes[.foregroundColor] as? UIColor, color)
        XCTAssertEqual(attributes[.font] as? UIFont, font)
        
        if let underlineStyle = attributes[.underlineStyle] as? NSUnderlineStyle.RawValue {
            let underlineColorAttribute = attributes[.underlineColor]
            XCTAssertEqual(underlineStyle, NSUnderlineStyle.single.rawValue)
            XCTAssertEqual(UIColor(cgColor: underlineColorAttribute as! CGColor), underlineColor)
        } else {
            XCTFail("Underline attributes not found")
        }
        
        XCTAssertEqual(attributedString.string, string)
    }
}
