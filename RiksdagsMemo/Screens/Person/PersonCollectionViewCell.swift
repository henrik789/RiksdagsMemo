

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var party: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static var identifier: String {
        return "PersonCollectionViewCell"
    }
    
    func config(){
        
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.6
        imageView.layer.shadowOffset = CGSize(width: 2, height: 3)
        let size = CGSize(width: 60, height: 60)
        let rect = CGRect(origin: .zero, size: size)
        imageView.layer.shadowRadius = 3
        imageView.layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: 15).cgPath
        imageView.clipsToBounds = false
        
        //        nameLabel.layer.shadowColor = UIColor.yellow.cgColor
        //        nameLabel.layer.shadowOpacity = 1
        //        nameLabel.layer.shadowRadius = 3
        //        nameLabel.layer.shadowOffset = CGSize(width: 1, height: 2)
    }

}
