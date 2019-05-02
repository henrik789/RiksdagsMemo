import UIKit
import Kingfisher

private let cellIdentifier = "BasicCell"

class PersonViewController: UIViewController {
    
    let viewModel: PersonViewModel
    
    init(viewModel: PersonViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initConfig()

    }
    
    func initConfig() {
        self.title = viewModel.title
        loadData()
    }

    func loadData() {
        viewModel.updatePersons { (error) in
            self.view.updateFocusIfNeeded()
            print(self.viewModel.persons.count)
        }
    }
}

