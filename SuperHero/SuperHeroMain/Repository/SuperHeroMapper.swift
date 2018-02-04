import Foundation

enum mapperError: Error {
    case processError(Error)
}

class SuperHeroMapper: Mapper {

    typealias E = Error
    typealias T = SuperHero
    
    func process(data: Data) throws -> [SuperHero]  {
        let decoder = JSONDecoder()
        var superHeroes = [SuperHero]()
        do {
            let response = try decoder.decode(SuperHeroes.self, from: data)
            superHeroes.append(contentsOf: response.superheroes)
        } catch let error {
            throw mapperError.processError(error)
        }
        return superHeroes
    }
    
    func processError(dictionary: [String : AnyObject]) -> Error {
        return Error.self  as! Error
    }
}
