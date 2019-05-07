import UIKit
import Kingfisher

private let cellIdentifier = "BasicCell"

class PersonViewController: UIViewController {
    
    let viewModel: PersonViewModel
    @IBOutlet weak var collectionView: UICollectionView!
    
    
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
        
        
    }
    
    func loadData() {
        viewModel.updatePersons {
            (error) in
            self.collectionView.reloadData()
            print(self.viewModel.persons)
            self.title = self.viewModel.title
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
            self.collectionView.register(UINib.init(nibName: PersonCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PersonCollectionViewCell.identifier)
        }
    }
}

extension PersonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.persons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.identifier, for: indexPath) as! PersonCollectionViewCell
        let person = viewModel.persons[indexPath.row]
        cell.config()
        cell.fullnameLabel.text = person.fullName()
        cell.gender.text = person.age()
        cell.party.text = person.parti
        cell.status.text = person.status
        let url = URL(string: person.urlLink)
        print(person.urlLink)
        cell.imageView.kf.indicatorType = .activity
        cell.imageView.kf.setImage(with: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let vc = MapViewController()
        //        self.present(vc, animated: true, completion: nil)
    }
}
