import UIKit

class SuperHeroNavigationController: UINavigationController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func hidde() {
        UIView.animate(withDuration: 0.2) {
            self.isNavigationBarHidden = true
        }
    }
    
    func show() {
        UIView.animate(withDuration: 0.2) {
            self.isNavigationBarHidden = false
        }
    }
    
    func setupBackgroundImage(superHero: SuperHero) {
        let imageView = UIImageView()
        imageView.setImage(urlString: superHero.photo)
        imageView.addBlurEffect()
        navigationBar.setBackgroundImage(imageView.image, for: .default)
    }
}
