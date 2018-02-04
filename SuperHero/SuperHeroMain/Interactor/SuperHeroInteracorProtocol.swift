import Foundation

protocol SuperHeroInteractorProtocol {
    func execute(completionHandler: @escaping () -> Void)
    func superHero(at indexPath: IndexPath) -> SuperHero
    func allSuperHeroes() -> [SuperHero]
}
