import Foundation

class SuperHeroRepository: Repository {
   
    private lazy var superHeroStorage = SuperHeroStorage()
    private lazy var superHeroAPIService = SuperHeroAPIClient()
    private lazy var superHeroMapper = SuperHeroMapper()
    typealias T = [SuperHero]
    
    func getSuperHeroes(completionHandler: @escaping ([SuperHero])->(), errorHandler: @escaping (Error)->())  {
        superHeroAPIService.getSuperHeroes(completionhandler: { data in
            do {
                let superHeroes = try self.superHeroMapper.process(data: data)
                superHeroes.forEach {
                    self.superHeroStorage.add(superHero: $0)
                }
                completionHandler(self.superHeroStorage.superHeroes())
            } catch let error {
                errorHandler(error)
            }
            
        }) { error in
            errorHandler(error)
        }
    }
}
