import UIKit
import Alamofire

class SuperHeroTableCell: BaseTableViewCell<SuperHero> {

    @IBOutlet weak var superHeroNameLabel: UILabel!
    @IBOutlet weak var superHeroImageView: UIImageView!
    
    override func setupGUI() {
        superHeroNameLabel.text = viewModel.name
        superHeroImageView.setImage(urlString: viewModel.photo)
    }
}
