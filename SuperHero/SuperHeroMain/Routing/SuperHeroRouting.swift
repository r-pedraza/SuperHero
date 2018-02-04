import UIKit

class SuperHeroRouting: SuperHeroRoutingProtocol {
    let navigationController: UINavigationController!
    let viewController: SuperHeroViewController!
    
    init(navigationController: UINavigationController, viewController: SuperHeroViewController) {
        self.navigationController = navigationController
        self.viewController = viewController
    }
    
    func setup() {
        let interactor = SuperHeroInteractor()
        let presenter = SuperHeroPresenter()
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.routing = self
        presenter.view = viewController
        viewController.presenter = presenter
    }
    //MARK: SuperHeroRoutingProtocol
    
    func superHeroDetail(with superHero: SuperHero) {
        let storyBoard = UIStoryboard(name: "SuperHeroDetail", bundle: nil)
        if let superHeroDetailViewController = storyBoard.instantiateViewController(withIdentifier: "SuperHeroDetailID") as? SuperHeroDetail {
            navigationController.pushViewController(superHeroDetailViewController, animated: true)
        }
    }
}
