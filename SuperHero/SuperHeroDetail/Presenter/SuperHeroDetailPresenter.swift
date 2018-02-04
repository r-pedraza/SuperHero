import Foundation

class SuperHeroDetailPresenter: SuperHeroDetailPresenterProtocol {
    var interactor: SuperHeroDetailInteractorProtocol!
    var routing: SuperHeroDetailRoutingProtocol!
    weak var view: SuperHeroDetailViewProtocol!
}
