import UIKit

class SuperHeroViewController: UIViewController, SuperHeroViewProtocol {
    var presenter: SuperHeroPresenterProtocol!
    @IBOutlet weak var tableView: UITableView!
    
    var tableCellFactoryReference: TableCellFactory {
        return TableCellFactory(tableView: tableView)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        if let navigationController = navigationController as? SuperHeroNavigationController {
            _ = SuperHeroRouting(navigationController: navigationController, viewController: self).setup()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let navigationController = navigationController as? SuperHeroNavigationController {
            navigationController.hidde()
        }
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 180
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(SuperHeroTableCell.self)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

    //MARK: UITableViewDataSource, UITableViewDelegate
extension SuperHeroViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter.buildCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.selectRow(at: indexPath)
    }
}
