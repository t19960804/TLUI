import UIKit

extension UIView {
    public func addCorner(_ cornerRadius: CGFloat, clipsToBounds: Bool = true) {
        self.clipsToBounds = clipsToBounds
        self.layer.cornerRadius = cornerRadius
    }
    
    public func addGradient(colors: [UIColor], size: CGSize, direction: CAGradientLayer.Direction, corner: CGFloat) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "gradientLayer"
        gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        gradientLayer.colors = colors.map { $0.cgColor }
        switch direction {
        case .Top_Bottom:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        case .Bottom_Top:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        case .Left_Right:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .Right_Left:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        }
        gradientLayer.cornerRadius = corner
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    public func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    public func addShadow(shadowOpacity: Float, shadowOffset: CGSize, shadowRadius: CGFloat, shadowColor: CGColor) {
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor
    }
}

extension UIView {
    public func fillInSuperView() {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    
    public func centerInSuperView(size: CGSize) {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height)
        ])
    }
    
    public func centerXInSuperView() {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        ])
    }
    
    public func centerYInSuperView() {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ])
    }
    
    public func addYAnchorConstraint(equalTo: NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    public func addXAnchorConstraint(equalTo: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
        centerXAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    public func addConstraints(leadingAnchorTuple: (NSLayoutXAxisAnchor, CGFloat)? = nil, topAnchorTuple: (NSLayoutYAxisAnchor, CGFloat)? = nil, trailingAnchorTuple: (NSLayoutXAxisAnchor, CGFloat)? = nil, bottomAnchorTuple: (NSLayoutYAxisAnchor, CGFloat)? = nil) {
        if let tuple = leadingAnchorTuple {
            leadingAnchor.constraint(equalTo: tuple.0, constant: tuple.1).isActive = true
        }
        if let tuple = topAnchorTuple {
            topAnchor.constraint(equalTo: tuple.0, constant: tuple.1).isActive = true
        }
        if let tuple = trailingAnchorTuple {
            trailingAnchor.constraint(equalTo: tuple.0, constant: -tuple.1).isActive = true
        }
        if let tuple = bottomAnchorTuple {
            bottomAnchor.constraint(equalTo: tuple.0, constant: -tuple.1).isActive = true
        }
    }
    
    public func addHeightConstraint(equalTo: NSLayoutDimension? = nil, equalToConstant: CGFloat? = nil) {
        if let equalTo = equalTo {
            heightAnchor.constraint(equalTo: equalTo).isActive = true
        }
        if let equalToConstant = equalToConstant {
            heightAnchor.constraint(equalToConstant: equalToConstant).isActive = true
        }
    }
    
    public func addWidthConstraint(equalTo: NSLayoutDimension? = nil, equalToConstant: CGFloat? = nil) {
        if let equalTo = equalTo {
            widthAnchor.constraint(equalTo: equalTo).isActive = true
        }
        if let equalToConstant = equalToConstant {
            widthAnchor.constraint(equalToConstant: equalToConstant).isActive = true
        }
    }
}
