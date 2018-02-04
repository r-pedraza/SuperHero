import UIKit

class SuperHeroRouting: SuperHeroRoutingProtocol {
    private let navigationController: SuperHeroNavigationController!
    private let viewController: SuperHeroViewController!
    
    init(navigationController: SuperHeroNavigationController, viewController: SuperHeroViewController) {
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
        navigationController.show()
        let storyBoard = UIStoryboard(name: "SuperHeroDetailViewController", bundle: nil)
        if let superHeroDetailViewController = storyBoard.instantiateViewController(withIdentifier: "SuperHeroDetailViewControllerID") as? SuperHeroDetailViewController {
            navigationController.pushViewController(viewController: superHeroDetailViewController, animated: true, completion: {
                superHeroDetailViewController.setup(with: superHero)
            })
        }
    }
}
