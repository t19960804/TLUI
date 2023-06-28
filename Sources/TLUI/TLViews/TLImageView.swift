import UIKit

open class TLImageView: UIImageView {
    
    public init(imageName: String, contentMode: ContentMode = .scaleToFill) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = UIImage(named: imageName)
        self.contentMode = contentMode
    }
    
    public func setImageFromAssets(name: String) {
        self.image = UIImage(named: name)
    }
    
    public func setImageFromBundle(name: String) {
        for type in ["jpg", "png"] {
            if let path = Bundle.main.path(forResource: name, ofType: type),
               let image = UIImage(contentsOfFile: path) {
                self.image = image
                return
            }
        }
    }
    
    public func addTintColor(_ color: UIColor) {
        self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
