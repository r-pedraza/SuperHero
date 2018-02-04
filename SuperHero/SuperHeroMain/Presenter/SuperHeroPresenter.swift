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
        return interactor.superHeroes.count
    }
    
    func buildCell(at indexpath: IndexPath) -> UITableViewCell {
        let superHero = interactor.superHero(at: indexpath.row)
        return view.tableCellFactoryReference.createCell(viewModel: superHero) as SuperHeroTableCell
    }
    
    func selectRow(at: IndexPath) {
        
    }
    
    func superHero(at: IndexPath) -> ViewModel {
        return ViewModel.self as! ViewModel
    }
    
    func reloadData() {
        view.reloadData()
    }
}
