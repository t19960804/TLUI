import XCTest

final class ExtensionCALayerTest: XCTestCase {
    func testAddBreatheAnimation() {
        let layer = CALayer()
        let values: [CGFloat] = [1.0, 1.07, 1.0]
        let keyTimes: [NSNumber] = [0.0, 0.125, 0.25]
        let duration: Float = 10.0
        
        layer.addBreatheAnimation(values: values, keyTimes: keyTimes, duration: duration)
        
        guard let animation = layer.animation(forKey: "breathe") as? CAKeyframeAnimation else {
            XCTFail("Breathe animation not found")
            return
        }
        
        XCTAssertEqual(animation.keyPath, "transform.scale")
        XCTAssertEqual(animation.values as? [CGFloat], values)
        XCTAssertEqual(animation.keyTimes, keyTimes)
        XCTAssertEqual(animation.duration, CFTimeInterval(duration))
        XCTAssertEqual(animation.repeatCount, Float.infinity)
    }
}
