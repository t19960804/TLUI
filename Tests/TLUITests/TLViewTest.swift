import XCTest
import TLUI

final class TLViewTest: XCTestCase {
    func testInitWithBackgroundColor() {
        let view = TLView(backgroundColor: .blue, corner: 10.0)
        
        XCTAssertEqual(view.backgroundColor, .blue)
        XCTAssertEqual(view.layer.cornerRadius, 10.0)
    }
    
    func testInitWithDefaultCorner() {
        let view = TLView(backgroundColor: .green)
        
        XCTAssertEqual(view.backgroundColor, .green)
        XCTAssertEqual(view.layer.cornerRadius, 0.0)
    }

}
