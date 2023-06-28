import UIKit

open class TLBlurEffectView: UIVisualEffectView {
    private var animator: UIViewPropertyAnimator!
    // radius: 0 - 1, 值越大越模糊
    public init(style: UIBlurEffect.Style, radius: CGFloat) {
        super.init(effect: nil)
        translatesAutoresizingMaskIntoConstraints = false
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear) {
            [unowned self] in
            self.effect = UIBlurEffect(style: style)
        }
        animator.fractionComplete = radius
        animator.pausesOnCompletion = true
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
