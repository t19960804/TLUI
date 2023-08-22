import XCTest
import TLUI

final class TLButtonTest: XCTestCase {
    func testInitWithText() {
        let button = TLButton(text: "Click Me", textColor: .white, font: UIFont.systemFont(ofSize: 16), backgroundColor: .blue, corner: 10.0)
        
        XCTAssertEqual(button.titleLabel?.text, "Click Me")
        XCTAssertEqual(button.titleLabel?.textColor, .white)
        XCTAssertEqual(button.backgroundColor, .blue)
        XCTAssertEqual(button.layer.cornerRadius, 10.0)
        XCTAssertEqual(button.titleLabel?.font, UIFont.systemFont(ofSize: 16))
    }
    
    func testInitWithBackgroundColor() {
        let button = TLButton(backgroundColor: .green, corner: 5.0)
        
        XCTAssertEqual(button.backgroundColor, .green)
        XCTAssertEqual(button.layer.cornerRadius, 5.0)
    }
    
    func testSetAttributedTitle() {
        let attributedStrings: [NSAttributedString?] = [
            NSAttributedString(string: "Hello, ", attributes: [.foregroundColor: UIColor.red]),
            NSAttributedString(string: "world!", attributes: [.foregroundColor: UIColor.blue])
        ]
        
        let button = TLButton(backgroundColor: .yellow)
        button.setAttributedTitle(attributedStrings: attributedStrings)
        
        let expectedAttributedString = NSMutableAttributedString()
        expectedAttributedString.append(NSAttributedString(string: "Hello, ", attributes: [.foregroundColor: UIColor.red]))
        expectedAttributedString.append(NSAttributedString(string: "world!", attributes: [.foregroundColor: UIColor.blue]))
        
        XCTAssertEqual(button.attributedTitle(for: .normal), expectedAttributedString)
    }
}
