import UIKit
import Kingfisher

private let cellIdentifier = "BasicCell"

class PersonViewController: UIViewController {
    
    let viewModel: PersonViewModel
    let persons = [Person]()
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var party: UILabel!
    @IBOutlet weak var birth: UILabel!
    
    init(viewModel: PersonViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        initConfig()
        viewModel.dataManager.getAllData { (persons, error) in
            print("Lista: ")
            print(self.viewModel.dataManager.list.count)
            
            DispatchQueue.main.async {
                self.firstname.text = persons[2].firstName
                self.lastname.text = persons[44].lastName
                self.party.text = persons[322].parti
                self.birth.text = persons[12].fullName()
            }
            
            
        }

    }
    
//    func initConfig() {
//        self.title = viewModel.title
//        loadData()
//    }

//    func loadData() {
//        viewModel.updatePersons { (error) in
//            self.view.updateFocusIfNeeded()
//            print(self.viewModel.persons.count)
//        }
//    }
}

