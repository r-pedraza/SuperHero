import UIKit

protocol SuperHeroPresenterProtocol {
    var numberOfSections: Int { get }
    func numberOfRows(at section: Int) -> Int
    func buildCell(at indexpath: IndexPath) -> UITableViewCell
    func selectRow(at indexPath: IndexPath)
    func superHero(at: IndexPath) -> ViewModel
    func reloadData()
}
