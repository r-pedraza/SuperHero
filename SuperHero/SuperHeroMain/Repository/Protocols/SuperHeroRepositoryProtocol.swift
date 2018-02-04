import Foundation

protocol Repository {
    associatedtype T
    func getSuperHeroes(completionHandler: @escaping (T)->(), errorHandler: @escaping (Error)->()) 
}

