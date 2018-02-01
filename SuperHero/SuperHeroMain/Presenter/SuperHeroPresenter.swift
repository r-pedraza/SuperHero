import UIKit

class SuperHeroPresenter: SuperHeroPresenterProtocol {
    var interactor: SuperHeroInteractorProtocol!
    var routing: SuperHeroRoutingProtocol!
    weak var view: SuperHeroViewProtocol!
    
    //MARK: SuperHeroPresenterProtocol
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRows(at section: Int) -> Int {
        return 1
    }
    
    func buildCell(at indexpath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
