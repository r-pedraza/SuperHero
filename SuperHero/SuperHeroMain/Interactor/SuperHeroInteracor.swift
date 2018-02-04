import Foundation

class SuperHeroInteractor: SuperHeroInteractorProtocol {
    var presenter: SuperHeroPresenterProtocol!
    let superHeroRepository = SuperHeroRepository()
    var superHeroes = [SuperHero]()
    
    init() {
        execute()
    }
    
    private func execute() {
        superHeroRepository.getSuperHeroes(completionHandler: { superHeroresResponse in
            self.superHeroes = superHeroresResponse
            self.presenter.reloadData()
        }, errorHandler: { error in
            debugPrint(error)
        })
    }
    
    func superHero(at index: Int) -> SuperHero {
        return superHeroes[index]
    }
}
