import UIKit

class SuperHeroTableCell: BaseTableViewCell<SuperHero> {
    @IBOutlet weak var superHeroNameLabel: UILabel!
    @IBOutlet weak var superHeroImageView: UIImageView!
    @IBOutlet weak var blurImageView: UIImageView!
    
    override func setupGUI() {
        superHeroNameLabel.text = viewModel.name
        superHeroImageView.setImage(urlString: viewModel.photo)
    }
}
