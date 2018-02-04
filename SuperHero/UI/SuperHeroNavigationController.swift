import UIKit

class SuperHeroNavigationController: UINavigationController {

    private enum Constants {
        static let animationDuration: Double = 0.2
    }
    
    func setHidden(_ hidde: Bool) {
        UIView.animate(withDuration: Constants.animationDuration) {
            self.isNavigationBarHidden = hidde
        }
    }
    
    func setupBackgroundImage(superHero: SuperHero) {
        let imageView = UIImageView()
        imageView.setImage(urlString: superHero.photo)
        imageView.addBlurEffect()
        navigationBar.setBackgroundImage(imageView.image, for: .default)
    }
}
