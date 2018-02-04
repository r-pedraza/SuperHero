import Foundation

class SuperHeroInteractor: SuperHeroInteractorProtocol {
    let superHeroRepository: SuperHeroRepository
    
    init(repository: SuperHeroRepository) {
        self.superHeroRepository = repository
    }
    
    func execute(completionHandler: @escaping () -> Void) {
        superHeroRepository.fetchAllItems(completionHandler: { superHeroresResponse in
            completionHandler()
        }, errorHandler: { error in
            debugPrint(error)
        })
    }
    
    func superHero(at index: IndexPath) -> SuperHero {
        return superHeroRepository.fetchItem(at: index)
    }
    
    func allSuperHeroes() -> [SuperHero] {
        return superHeroRepository.items
    }
}
