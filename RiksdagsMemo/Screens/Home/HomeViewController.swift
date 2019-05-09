
import UIKit

protocol HomeViewControllerDelegate: class {
    func homeViewController(_ viewController: HomeViewController, didSelect action: HomeViewControllerAction)
}

enum HomeViewControllerAction {
    case person
}

class HomeViewController: UIViewController {
    weak var delegate: HomeViewControllerDelegate?
    
    @IBOutlet weak var factsButton: UIButton!
    @IBOutlet weak var graphsButton: UIButton!
    @IBOutlet weak var memoryButton: UIButton!
    @IBOutlet weak var personsButton: UIButton!
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.title = "Navigation"
        config()
    }
    
    @IBAction func personsButton(_ sender: Any) {
        delegate?.homeViewController(self, didSelect: .person)
    }
    func config(){
        personsButton.commonStyle()
        factsButton.commonStyle()
        memoryButton.commonStyle()
        graphsButton.commonStyle()
        
        let navbar = navigationController?.navigationBar
        navbar?.prefersLargeTitles = true
        navbar?.barStyle = .default
        navbar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,  NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 21)!]
        navbar?.tintColor = UIColor.black

    }
}

