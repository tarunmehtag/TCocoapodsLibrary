import UIKit

@objc protocol CollectionCellDelegate {
    @objc optional func updateCollectionCellModel(_ model: Any,_ cell: AbstractCollectionCell,_ item: Int)
    @objc optional func addNewCollectionCell(_ section: NSInteger)
    @objc optional func deleteCollectionCell(_ cell: AbstractCollectionCell)
}

class AbstractCollectionCell: UICollectionViewCell {
    
    var delegate: CollectionCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateWith(_ model: Any,_ item: Int,_ count: Int,_ type: String){
        
    }
    
}
