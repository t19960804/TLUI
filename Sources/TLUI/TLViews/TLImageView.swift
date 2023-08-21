import UIKit

open class TLImageView: UIImageView {
    private var fromModule: Bool!
    
    public init(imageName: String, contentMode: ContentMode = .scaleToFill, fromModule: Bool = false) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = fromModule ? UIImage(named: imageName, in: .module, with: nil) : UIImage(named: imageName)
        self.contentMode = contentMode
        self.fromModule = fromModule
    }
    
    public func setImageFromAssets(name: String) {
        self.image = fromModule ? UIImage(named: name, in: .module, with: nil) : UIImage(named: name)
    }
    
    public func setImageFromBundle(name: String) {
        var environment: Bundle = .main
        if fromModule {
            environment = .module
        }
        for type in ["jpg", "png", "jpeg"] {
            if let path = environment.path(forResource: name, ofType: type),
               let image = UIImage(contentsOfFile: path) {
                self.image = image
                return
            }
        }
    }
    
    public func addTintColor(_ color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
