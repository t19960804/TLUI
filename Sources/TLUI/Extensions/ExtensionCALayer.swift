import UIKit

extension CALayer {
    public func addBreatheAnimation(values: [Any], keyTimes: [NSNumber], duration: Float) {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        // values > scale的倍率
        // keyTimes > values中每個value對應到的秒數(按比例計算, 範圍在0-1)
        // 以下方為例, 假設動畫總時長為10秒
        // 0秒到1.25秒間, 將會從1倍放大到1.07倍
        // 1.25秒到2.5秒間, 將會從1.07倍縮小到1倍
        animation.values = values
        animation.keyTimes = keyTimes
        animation.duration = CFTimeInterval(duration)
        animation.repeatCount = Float.infinity
        animation.beginTime = CACurrentMediaTime()
        add(animation, forKey: "breathe")
    }
}
