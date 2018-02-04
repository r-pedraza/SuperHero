import Foundation

class SuperHeroDetailRouting: SuperHeroDetailRoutingProtocol {
    private let superHeroDetailViewController: SuperHeroDetailViewController
    
    init(superHeroDetailViewController: SuperHeroDetailViewController) {
        self.superHeroDetailViewController = superHeroDetailViewController
    }
    
    func setup() {
        let interactor = SuperHeroDetailInteractor()
        let presenter = SuperHeroDetailPresenter()
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.routing = self
        presenter.view = superHeroDetailViewController
        superHeroDetailViewController.presenter = presenter
    }
}
