import Foundation
import UIKit

class BaseTableViewCell<VM: ViewModel>: UITableViewCell {
    
    var viewModel: VM! {
        didSet {
            setupGUI()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupGUI() {
        
    }
}


