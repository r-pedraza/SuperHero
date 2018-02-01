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
}
