import UIKit

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
