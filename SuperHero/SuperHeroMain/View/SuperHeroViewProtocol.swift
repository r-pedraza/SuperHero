import Foundation

protocol SuperHeroViewProtocol: class {
    var tableCellFactoryReference: TableCellFactory { get }
    func reloadData()
}
