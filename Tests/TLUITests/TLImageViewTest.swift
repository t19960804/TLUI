import XCTest
import TLUI

final class TLImageViewTest: XCTestCase {
    private let imageNameFromAssets = "PatrickFromAssets"
    private let imageNameFromBundle = "PatrickFromBundle"

    func testInitWithImageName_FromModule() {
        let contentMode: UIView.ContentMode = .scaleAspectFit
        let imageView = TLImageView(imageName: imageNameFromAssets, contentMode: contentMode, fromModule: true)
        let imageFromAssets = UIImage(named: imageNameFromAssets, in: .module, with: nil)
        
        XCTAssertEqual(imageView.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(imageView.image?.pngData(), imageFromAssets?.pngData())
        XCTAssertEqual(imageView.contentMode, contentMode)
    }
    
    func testInitWithImageName_NotFromModule() {
        let contentMode: UIView.ContentMode = .scaleAspectFit
        let imageView = TLImageView(imageName: imageNameFromAssets, contentMode: contentMode)
        
        XCTAssertEqual(imageView.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(imageView.image, nil)
        XCTAssertEqual(imageView.contentMode, contentMode)
    }
    
    func testSetImageFromAssets_FromModule() {
        let imageName = imageNameFromAssets
        let imageView = TLImageView(imageName: "", fromModule: true)
        imageView.setImageFromAssets(name: imageName)
        let imageFromAssets = UIImage(named: imageName, in: .module, with: nil)

        XCTAssertEqual(imageView.image?.pngData(), imageFromAssets?.pngData())
    }
        
    func testSetImageFromAssets_NotFromModule() {
        let imageView = TLImageView(imageName: "")
        imageView.setImageFromAssets(name: imageNameFromAssets)
        
        XCTAssertEqual(imageView.image, nil)
    }
    
    func testSetImageFromBundle() {
        let imageName = imageNameFromBundle
        let imageView = TLImageView(imageName: "", fromModule: true)
        imageView.setImageFromBundle(name: imageName)
        let path = Bundle.module.path(forResource: imageName, ofType: "jpeg")
        let imageFromBundle = UIImage(contentsOfFile: path!)!
        
        XCTAssertEqual(imageView.image!.pngData(), imageFromBundle.pngData())
    }
    
    func testSetImageFromBundle_NilImage() {
        let imageView = TLImageView(imageName: "", fromModule: true)
        imageView.setImageFromBundle(name: "123")
        
        XCTAssertEqual(imageView.image, nil)
    }
    
    func testAddTintColor() {
        let imageView = TLImageView(imageName: imageNameFromAssets, fromModule: true)
        let tintColor = UIColor.red
        imageView.addTintColor(tintColor)
       
        XCTAssertEqual(imageView.image?.renderingMode, .alwaysTemplate)
        XCTAssertEqual(imageView.tintColor, tintColor)
   }
}
