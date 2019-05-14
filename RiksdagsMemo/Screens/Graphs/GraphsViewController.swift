

import UIKit

private let reuseIdentifier = "Cell"

class GraphsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let colors: [UIColor] = [UIColor.aluminum, UIColor.blueberry, UIColor.aqua, UIColor.asparagus ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initConfig()
        
    }
    
    func initConfig() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: GraphsViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: GraphsViewCell.identifier)
    }
}

extension GraphsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GraphsViewCell.identifier, for: indexPath) as! GraphsViewCell

        cell.backgroundColor = colors[indexPath.row]
        // Configure the cell
        
        return cell
    }
    
    
}