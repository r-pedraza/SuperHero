import UIKit

class SuperHeroViewController: UIViewController, SuperHeroViewProtocol {
    var presenter: SuperHeroPresenterProtocol!
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let navigationController = navigationController {
            _ = SuperHeroRouting(navigationController: navigationController, viewController: self).setup()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

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
    
}
