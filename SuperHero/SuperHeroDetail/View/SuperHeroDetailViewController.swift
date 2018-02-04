import UIKit

class SuperHeroDetailViewController: UIViewController, SuperHeroDetailViewProtocol {
    var presenter: SuperHeroDetailPresenterProtocol!
    
    @IBOutlet weak var superHeroImageView: UIImageView!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var groupsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _ = SuperHeroDetailRouting(superHeroDetailViewController: self).setup()
    }
    
    //MARK: SuperHeroDetailViewProtocol
    
    func setup(with superHero: SuperHero) {
        title = superHero.name
        superHeroImageView.setImage(urlString: superHero.photo)
        superHeroImageView.addBlurEffect()
        realNameLabel.text = superHero.realName
        heightLabel.text = superHero.height
        powerLabel.text = superHero.power
        abilitiesLabel.text = superHero.abilities
        groupsLabel.text = superHero.groups
    }

}
