import UIKit

@objc protocol TableCellDelegate {
    @objc optional func updateTblCellModel(_ model: Any,_ cell: AbstractTblCell,_ item: Int, _ type: String)
    @objc optional func addNewTblCell(_ section: NSInteger)
    @objc optional func deleteTblCell(_ cell: AbstractTblCell)
}

class AbstractTblCell: UITableViewCell {

    var delegate: TableCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateWith(_ model: Any,_ row: Int,_ arrayCount: Int,_ type: String){
        
    }

}

