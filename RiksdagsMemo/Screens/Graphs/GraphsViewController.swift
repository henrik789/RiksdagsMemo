

import UIKit

private let reuseIdentifier = "Cell"

class GraphsViewController: UIViewController {
    
    let viewModel: GraphsViewModel
    
    init(viewModel: GraphsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    let colors: [UIColor] = [UIColor.aluminum, UIColor.blueberry, UIColor.aqua, UIColor.asparagus, UIColor.banana, UIColor.black, UIColor.blue, UIColor.brown, UIColor.bubblegum, UIColor.cantalope, UIColor.carnation, UIColor.cayenne]
    let colorstext: [String] = ["aluminum", "blueberry", "aqua", "asparagus", "banana", "black", "blue", "brown", "bubblegum", "cantalope", "carnation", "cayenne" ]

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
        
        cell.textLabel.text = colorstext[indexPath.row]
        cell.backgroundColor = colors[indexPath.row]
        // Configure the cell
        
        return cell
    }
    
    
}
