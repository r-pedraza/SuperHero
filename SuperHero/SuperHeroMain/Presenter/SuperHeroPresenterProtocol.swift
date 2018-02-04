import UIKit

protocol SuperHeroPresenterProtocol {
    var numberOfSections: Int { get }
    func numberOfRows(at section: Int) -> Int
    func selectRow(at indexPath: IndexPath)
    func superHero(at: IndexPath) -> SuperHero
    func execute()
}
