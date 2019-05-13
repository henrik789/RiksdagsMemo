
import UIKit


public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

class MainNavigationController: UINavigationController {
    let serviceManager = ServiceManager()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setRootViewController()
        print(screenWidth, screenHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MainNavigationController {
    func setRootViewController() {
        let homeViewController = HomeViewController()
        homeViewController.delegate = self
        viewControllers = [homeViewController]
    }
}


extension MainNavigationController: HomeViewControllerDelegate {
    
    func homeViewController(_ viewController: HomeViewController, didSelect action: HomeViewControllerAction) {
        
        let viewController: UIViewController
        switch action {
        case .person:
            let personViewModel = PersonViewModel(dataManager: serviceManager.dataManager)
            viewController = PersonViewController(viewModel: personViewModel)
        }

        
        pushViewController(viewController, animated: true)
        
    }
    
}

