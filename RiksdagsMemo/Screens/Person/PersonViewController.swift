import UIKit
import Kingfisher

private let cellIdentifier = "BasicCell"

class PersonViewController: UIViewController {
    
    let viewModel: PersonViewModel
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
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
        loadData()
        self.title = self.viewModel.title
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: PersonCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PersonCollectionViewCell.identifier)
    }
    
    func loadData() {
        activityIndicator.startAnimating()
        viewModel.updatePersons {
            (error) in
            self.collectionView.reloadData()
        }
    }
}

extension PersonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.persons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.identifier, for: indexPath) as! PersonCollectionViewCell
        self.activityIndicator.stopAnimating()
        self.activityIndicator.hidesWhenStopped = true
        let person = viewModel.persons[indexPath.row]
        cell.config(firstName: person.fullName(), status: person.status, party: person.parti, urlLink: person.urlLink, age: person.age(), valkrets: person.valkrets)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let vc = MapViewController()
        //        self.present(vc, animated: true, completion: nil)
    }
}
