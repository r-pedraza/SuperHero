import Foundation

class SuperHeroPresenter: SuperHeroPresenterProtocol {
    var interactor: SuperHeroInteractorProtocol!
    var routing: SuperHeroRoutingProtocol!
    weak var view: SuperHeroViewProtocol!
    //MARK: SuperHeroPresenterProtocol
    func execute() {
        interactor.execute(completionHandler: {
            self.view.reloadData()
        })
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRows(at section: Int) -> Int {
        return interactor.allSuperHeroes().count
    }
    
    func selectRow(at indexPath: IndexPath) {
        let superHero = interactor.superHero(at: indexPath)
        routing.superHeroDetail(with: superHero)
    }
    
    func superHero(at indexPath: IndexPath) -> SuperHero {
        return interactor.superHero(at: indexPath)
    }
}
