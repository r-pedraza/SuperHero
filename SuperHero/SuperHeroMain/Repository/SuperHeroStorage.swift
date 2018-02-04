import Foundation

class SuperHeroStorage {
    private var heroes = [SuperHero]()
    
    func add(superHero: SuperHero) {
        heroes.append(superHero)
    }
    
    func superHeroes() -> [SuperHero] {
        return heroes
    }
}
