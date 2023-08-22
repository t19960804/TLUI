import XCTest
import TLUI

final class TLCollectionViewTest: XCTestCase {
    func testInitWithParameters() {
        let cellId = "cellId"
        let cells: [(AnyClass, String)] = [
            (UICollectionViewCell.self, cellId),
        ]
        
        let collectionView = TLCollectionView(scrollDirection: .vertical, minimumInteritemSpacing: 10.0, minimumLineSpacing: 20.0, sectionInset: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20), cells: cells)
        
        XCTAssertNotNil(collectionView.collectionViewLayout as? UICollectionViewFlowLayout)
        XCTAssertEqual(collectionView.backgroundColor, .clear)
        XCTAssertFalse(collectionView.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(collectionView.showsHorizontalScrollIndicator)
        XCTAssertFalse(collectionView.showsVerticalScrollIndicator)
        
        let registeredCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: IndexPath(item: 0, section: 0))
        
        XCTAssertNotNil(registeredCell)
        XCTAssertTrue(registeredCell.isKind(of: UICollectionViewCell.self))
    }

}
