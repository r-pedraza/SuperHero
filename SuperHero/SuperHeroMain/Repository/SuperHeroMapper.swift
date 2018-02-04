import Foundation

enum MapperError: Error {
    case processError(Error)
}

class SuperHeroMapper: Mapper {
    typealias E = Error
    typealias T = SuperHeroes
    
    func process(data: Data) throws -> SuperHeroes {
        do {
            return try SuperHeroes.decode(data: data)
        } catch let error {
            throw MapperError.processError(error)
        }
    }
    
    func processError(dictionary: [String : Any]) -> Error {
        return "Error processing data \(dictionary)"
    }
}
