import XCTest
import TLUI

final class TLTopCornerViewTest: XCTestCase {

    func testInitWithBackgroundColorAndCorner() {
        let cornerView = TLTopCornerView(backgroundColor: .blue, corner: 10.0)
        
        XCTAssertEqual(cornerView.backgroundColor, .blue)
        XCTAssertEqual(cornerView.getCorner(), 10.0)
    }
    
    func testLayoutSubviews() {
        let corner: CGFloat = 5
        let superView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let cornerView = TLTopCornerView(backgroundColor: .green, corner: corner)
        superView.addSubview(cornerView)
        cornerView.centerInSuperView(size: .init(width: 50, height: 50))
        superView.layoutIfNeeded()
        
        let expectedPath = UIBezierPath(roundedRect: cornerView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: corner, height: corner))
        XCTAssertEqual((cornerView.layer.mask as? CAShapeLayer)?.path, expectedPath.cgPath)
    }

}
