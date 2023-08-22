import XCTest
import TLUI

final class TLLabelTest: XCTestCase {
    func testInitWithText() {
        let label = TLLabel(text: "Hello", textColor: .black, font: UIFont.systemFont(ofSize: 16), textAlignment: .center, numberOfLines: 2)
        
        XCTAssertEqual(label.text, "Hello")
        XCTAssertEqual(label.textColor, .black)
        XCTAssertEqual(label.font, UIFont.systemFont(ofSize: 16))
        XCTAssertEqual(label.textAlignment, .center)
        XCTAssertEqual(label.numberOfLines, 2)
    }
    
    func testInitWithAttributedStrings() {
        let attributedStrings: [NSAttributedString] = [
            NSAttributedString(string: "Hello, ", attributes: [.foregroundColor: UIColor.red]),
            NSAttributedString(string: "world!", attributes: [.foregroundColor: UIColor.blue])
        ]
        
        let label = TLLabel(attributedStrings: attributedStrings, numberOfLines: 2)
        
        let expectedAttributedString = NSMutableAttributedString()
        expectedAttributedString.append(NSAttributedString(string: "Hello, ", attributes: [.foregroundColor: UIColor.red]))
        expectedAttributedString.append(NSAttributedString(string: "world!", attributes: [.foregroundColor: UIColor.blue]))
        
        XCTAssertEqual(label.attributedText, expectedAttributedString)
        XCTAssertEqual(label.numberOfLines, 2)
    }
    
    func testSetAttributedText() {
        let attributedStrings: [NSAttributedString] = [
            NSAttributedString(string: "Hello, ", attributes: [.foregroundColor: UIColor.red]),
            NSAttributedString(string: "world!", attributes: [.foregroundColor: UIColor.blue])
        ]
        
        let label = TLLabel(text: nil, textColor: .black, font: UIFont.systemFont(ofSize: 16))
        label.setAttributedText(attributedStrings: attributedStrings)
        
        let expectedAttributedString = NSMutableAttributedString()
        expectedAttributedString.append(NSAttributedString(string: "Hello, ", attributes: [.foregroundColor: UIColor.red]))
        expectedAttributedString.append(NSAttributedString(string: "world!", attributes: [.foregroundColor: UIColor.blue]))
        
        XCTAssertEqual(label.attributedText, expectedAttributedString)
    }
}
