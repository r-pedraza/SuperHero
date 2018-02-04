import Foundation

protocol SuperHeroInteractorProtocol {
    var superHeroes: [SuperHero] { get }
    func superHero(at index: Int) -> SuperHero
}
