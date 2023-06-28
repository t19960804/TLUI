import UIKit

open class TLCollectionView: UICollectionView {
    public init(scrollDirection: UICollectionView.ScrollDirection ,minimumInteritemSpacing: CGFloat, minimumLineSpacing: CGFloat, sectionInset: UIEdgeInsets, cells: [(AnyClass, String)]) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        // minimumInteritemSpacing, 垂直 > 橫向cell的距離 ; 水平 > 直向cell的距離
        // minimumLineSpacing, 垂直 > 直向cell的距離 ; 水平 > 橫向cell的距離
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.minimumLineSpacing = minimumLineSpacing
        layout.sectionInset = sectionInset
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        regsiterCells(cells)
    }
    
    private func regsiterCells(_ cells: [(class: AnyClass, id: String)]) {
        for cell in cells {
            register(cell.class, forCellWithReuseIdentifier: cell.id)
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
