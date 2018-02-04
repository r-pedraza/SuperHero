import Foundation

class SuperHeroRepository: Repository {
    private var superHeroStorage = SuperHeroStorage()
    private var superHeroAPIService = SuperHeroAPIClient()
    private var superHeroMapper = SuperHeroMapper()
    typealias T = SuperHero
    
    func getAllItems(completionHandler: @escaping ([SuperHero]) -> Void, errorHandler: @escaping (Error) -> Void)  {
        superHeroAPIService.getSuperHeroes(completionhandler: { data in
            DispatchQueue.main.async {
                do {
                    let response = try self.superHeroMapper.process(data: data)
                    response.superheroes.forEach(self.superHeroStorage.add)
                    completionHandler(self.superHeroStorage.superHeroes())
                } catch let error {
                    errorHandler(error)
                }
            }
        }, errorHandler: errorHandler)
    }
    
    func getItem(at indexPath: IndexPath) -> SuperHero {
        return superHeroStorage.superHeroes()[indexPath.row]
    }
    
    var items: [SuperHero]{
        return superHeroStorage.superHeroes()
    }
}
