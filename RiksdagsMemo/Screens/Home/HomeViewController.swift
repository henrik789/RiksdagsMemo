
import UIKit
import CoreMotion

protocol HomeViewControllerDelegate: class {
    func homeViewController(_ viewController: HomeViewController, didSelect action: HomeViewControllerAction)
}

enum HomeViewControllerAction {
    case person
    case graphs
}

class HomeViewController: UIViewController {
    weak var delegate: HomeViewControllerDelegate?
    var motionManager = CMMotionManager()
    
    @IBOutlet weak var topView: UIView!
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
    @IBAction func graphsButton(_ sender: Any) {
//        delegate?.homeViewController(self, didSelect: .graphs)
        present(GraphsViewController(), animated: true)
    }
    
    
    func config(){
        personsButton.commonStyle()
        factsButton.commonStyle()
        memoryButton.commonStyle()
        graphsButton.commonStyle()
        
        let layergradient = CAGradientLayer()
        let startcolor = UIColor.aluminum.cgColor
        let endcolor = UIColor.steel.cgColor
        layergradient.colors = [startcolor, endcolor]
        layergradient.startPoint = CGPoint(x: 0, y: 0)
        layergradient.endPoint = CGPoint(x: 0, y: 1)
        layergradient.frame = CGRect(x: 0, y: 0, width: topView.bounds.width, height: topView.bounds.height)
//        topView.layer.addSublayer(layergradient)
        
        let navbar = navigationController?.navigationBar
        navbar?.isHidden = true
        navbar?.prefersLargeTitles = true
        navbar?.barStyle = .blackTranslucent
        navbar?.tintColor = UIColor.white

    }
}

