import Foundation

protocol Repository {
    associatedtype T
    func getAllItems(completionHandler: @escaping ([T]) -> Void, errorHandler: @escaping (Error) -> Void)
    func getItem(at indexPath: IndexPath) -> T
    var items: [T] { get }
}
