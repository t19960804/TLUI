import XCTest
@testable import TLUI

final class ExtensionUIViewTest: XCTestCase {
    func testAddCorner() {
        let view = UIView()
        view.addCorner(10, clipsToBounds: true)
        
        XCTAssertTrue(view.layer.cornerRadius == 10)
        XCTAssertTrue(view.clipsToBounds)
    }
    
    func testAddGradient_Top_Bottom() {
        let view = UIView()
        let colors: [UIColor] = [.red, .blue]
        let size = CGSize(width: 100, height: 100)
        let direction: CAGradientLayer.Direction = .Top_Bottom
        let corner: CGFloat = 10.0
        
        view.addGradient(colors: colors, size: size, direction: direction, corner: corner)
        
        guard let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer else {
            XCTFail("Gradient layer not added")
            return
        }
        
        XCTAssertEqual(gradientLayer.frame.size, size)
        XCTAssertEqual(gradientLayer.colors?.count, 2)
        XCTAssertEqual(gradientLayer.colors?[0] as! CGColor, colors[0].cgColor)
        XCTAssertEqual(gradientLayer.colors?[1] as! CGColor, colors[1].cgColor)
        XCTAssertEqual(gradientLayer.startPoint, CGPoint(x: 0.5, y: 0.0))
        XCTAssertEqual(gradientLayer.endPoint, CGPoint(x: 0.5, y: 1))
        XCTAssertEqual(gradientLayer.cornerRadius, corner)
    }
    
    func testAddGradient_Bottom_Top() {
        let view = UIView()
        let colors: [UIColor] = [.red, .blue]
        let size = CGSize(width: 100, height: 100)
        let direction: CAGradientLayer.Direction = .Bottom_Top
        let corner: CGFloat = 10.0
        
        view.addGradient(colors: colors, size: size, direction: direction, corner: corner)
        
        guard let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer else {
            XCTFail("Gradient layer not added")
            return
        }
        
        XCTAssertEqual(gradientLayer.frame.size, size)
        XCTAssertEqual(gradientLayer.colors?.count, 2)
        XCTAssertEqual(gradientLayer.colors?[0] as! CGColor, colors[0].cgColor)
        XCTAssertEqual(gradientLayer.colors?[1] as! CGColor, colors[1].cgColor)
        XCTAssertEqual(gradientLayer.startPoint, CGPoint(x: 0.5, y: 1))
        XCTAssertEqual(gradientLayer.endPoint, CGPoint(x: 0.5, y: 0.0))
        XCTAssertEqual(gradientLayer.cornerRadius, corner)
    }
    
    func testAddGradient_Left_Right() {
        let view = UIView()
        let colors: [UIColor] = [.red, .blue]
        let size = CGSize(width: 100, height: 100)
        let direction: CAGradientLayer.Direction = .Left_Right
        let corner: CGFloat = 10.0
        
        view.addGradient(colors: colors, size: size, direction: direction, corner: corner)
        
        guard let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer else {
            XCTFail("Gradient layer not added")
            return
        }
        
        XCTAssertEqual(gradientLayer.frame.size, size)
        XCTAssertEqual(gradientLayer.colors?.count, 2)
        XCTAssertEqual(gradientLayer.colors?[0] as! CGColor, colors[0].cgColor)
        XCTAssertEqual(gradientLayer.colors?[1] as! CGColor, colors[1].cgColor)
        XCTAssertEqual(gradientLayer.startPoint, CGPoint(x: 0, y: 0.5))
        XCTAssertEqual(gradientLayer.endPoint, CGPoint(x: 1, y: 0.5))
        XCTAssertEqual(gradientLayer.cornerRadius, corner)
    }
    
    func testAddGradient_Right_Left() {
        let view = UIView()
        let colors: [UIColor] = [.red, .blue]
        let size = CGSize(width: 100, height: 100)
        let direction: CAGradientLayer.Direction = .Right_Left
        let corner: CGFloat = 10.0
        
        view.addGradient(colors: colors, size: size, direction: direction, corner: corner)
        
        guard let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer else {
            XCTFail("Gradient layer not added")
            return
        }
        
        XCTAssertEqual(gradientLayer.frame.size, size)
        XCTAssertEqual(gradientLayer.colors?.count, 2)
        XCTAssertEqual(gradientLayer.colors?[0] as! CGColor, colors[0].cgColor)
        XCTAssertEqual(gradientLayer.colors?[1] as! CGColor, colors[1].cgColor)
        XCTAssertEqual(gradientLayer.startPoint, CGPoint(x: 1, y: 0.5))
        XCTAssertEqual(gradientLayer.endPoint, CGPoint(x: 0, y: 0.5))
        XCTAssertEqual(gradientLayer.cornerRadius, corner)
    }

    func testAddBorder() {
        let borderWidth: CGFloat = 1
        let borderColor: UIColor = .red
        let view = UIView()
        view.addBorder(width: borderWidth, color: borderColor)
        
        XCTAssertEqual(view.layer.borderWidth, borderWidth)
        XCTAssertEqual(view.layer.borderColor, borderColor.cgColor)
    }
    
    func testAddShadow() {
        let shadowOpacity: Float = 1
        let shadowOffset: CGSize = .init(width: 0, height: 2)
        let shadowRadius: CGFloat = 3
        let shadowColor: UIColor = .gray

        let view = UIView()
        view.addShadow(shadowOpacity: shadowOpacity, shadowOffset: shadowOffset, shadowRadius: shadowRadius, shadowColor: shadowColor.cgColor)
        
        XCTAssertEqual(view.layer.shadowOpacity, shadowOpacity)
        XCTAssertEqual(view.layer.shadowOffset, shadowOffset)
        XCTAssertEqual(view.layer.shadowRadius, shadowRadius)
        XCTAssertEqual(view.layer.shadowColor, shadowColor.cgColor)
    }
    
    func testFillInSuperView() {
        let superViewSize: CGRect = .init(x: 10, y: 10, width: 50, height: 50)
        let superview = UIView(frame: superViewSize)
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        superview.addSubview(view)
        view.fillInSuperView()
        superview.layoutIfNeeded()
        
        XCTAssertEqual(view.frame.minX, 0)
        XCTAssertEqual(view.frame.minY, 0)
        XCTAssertEqual(view.frame.size, .init(width: superViewSize.width, height: superViewSize.height))
    }
    
    func testFillInSuperView_NoSuperView() {
        let superview = UIView(frame: .init(x: 10, y: 10, width: 50, height: 50))
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        view.fillInSuperView()
        superview.layoutIfNeeded()
        
        XCTAssertEqual(view.frame.minX, 0)
        XCTAssertEqual(view.frame.minY, 0)
        XCTAssertEqual(view.frame.size, .zero)
    }
    
    func testCenterInSuperView() {
        let superview = UIView(frame: .init(x: 10, y: 10, width: 50, height: 50))
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let viewSize: CGSize = .init(width: 10, height: 10)
        superview.addSubview(view)
        view.centerInSuperView(size: viewSize)
        superview.layoutIfNeeded()
        
        // frame與center都是以super view為參考基準點
        XCTAssertEqual(view.center, .init(x: superview.frame.width / 2, y: superview.frame.height / 2))
        XCTAssertEqual(view.frame.size, viewSize)
    }
    
    func testCenterInSuperView_NoSuperView() {
        let superview = UIView(frame: .init(x: 10, y: 10, width: 50, height: 50))
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let viewSize: CGSize = .init(width: 10, height: 10)
        view.centerInSuperView(size: viewSize)
        superview.layoutIfNeeded()
        
        XCTAssertEqual(view.center, .zero)
        XCTAssertEqual(view.frame.size, .zero)
    }
    
    func testCenterXYInSuperView() {
        let superview = UIView(frame: .init(x: 10, y: 10, width: 50, height: 50))
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let width: CGFloat = 10
        superview.addSubview(view)
        view.centerXInSuperView()
        view.centerYInSuperView()
        view.addHeightConstraint(equalToConstant: width)
        view.addWidthConstraint(equalToConstant: width)
        superview.layoutIfNeeded()
        
        XCTAssertEqual(view.center, .init(x: superview.frame.width / 2, y: superview.frame.height / 2))
        XCTAssertEqual(view.frame.size, .init(width: width, height: width))
    }
    
    func testCenterXYInSuperView_NoSuperView() {
        let superview = UIView(frame: .init(x: 10, y: 10, width: 50, height: 50))
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.centerXInSuperView()
        view.centerYInSuperView()
        view.addHeightConstraint(equalToConstant: 10)
        view.addWidthConstraint(equalToConstant: 10)
        superview.layoutIfNeeded()
        
        XCTAssertEqual(view.center, .zero)
        XCTAssertEqual(view.frame, .zero)
    }
    
    func testAddXYAnchorConstraint() {
        let superview = UIView(frame: .init(x: 10, y: 10, width: 50, height: 50))
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let constant: CGFloat = 10
        let width: CGFloat = 20
        superview.addSubview(view)
        view.addXAnchorConstraint(equalTo: superview.centerXAnchor, constant: constant)
        view.addYAnchorConstraint(equalTo: superview.centerYAnchor, constant: constant)
        view.addWidthConstraint(equalToConstant: width)
        view.addHeightConstraint(equalToConstant: width)
        superview.layoutIfNeeded()
        
        XCTAssertEqual(view.center, .init(x: (superview.frame.width / 2) + constant, y: (superview.frame.height / 2) + constant))
        XCTAssertEqual(view.frame.size, .init(width: width, height: width))

    }
    
    func testAddConstraint() {
        let superview = UIView(frame: .init(x: 10, y: 10, width: 50, height: 50))
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let constant: CGFloat = 10
        superview.addSubview(view)
        view.addConstraints(leadingAnchorTuple: (superview.leadingAnchor, constant), topAnchorTuple: (superview.topAnchor, constant), trailingAnchorTuple: (superview.trailingAnchor, constant), bottomAnchorTuple: (superview.bottomAnchor, constant))
        superview.layoutIfNeeded()
        
        XCTAssertEqual(view.frame.minX, constant)
        XCTAssertEqual(view.frame.minY, constant)
        XCTAssertEqual(view.frame.size, .init(width: superview.frame.width - constant * 2, height: superview.frame.height - constant * 2))
    }
    
    func testAddHeightWidthConstraint() {
        let superview = UIView(frame: .init(x: 10, y: 10, width: 50, height: 50))
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        superview.addSubview(view)
        view.addHeightConstraint(equalTo: superview.heightAnchor)
        view.addWidthConstraint(equalTo: superview.widthAnchor)
        view.centerYInSuperView()
        view.centerXInSuperView()
        superview.layoutIfNeeded()
        
        XCTAssertEqual(view.center, .init(x: superview.frame.width / 2, y: superview.frame.height / 2))
        XCTAssertEqual(view.frame.size, .init(width: superview.frame.width, height: superview.frame.height))
    }
}
