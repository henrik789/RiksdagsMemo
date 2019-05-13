
import UIKit
import Kingfisher

class PersonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var valkretsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    static var identifier: String {
        return "PersonCollectionViewCell"
    }
    
    func config(firstName: String, status: String, party: String, urlLink: String, age: String, valkrets: String){
        
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        fullnameLabel.text = "Namn: " + firstName
        genderLabel.text = "Ålder: " + age
        partyLabel.text = "Parti: " + party
        statusLabel.text = status
        valkretsLabel.text = valkrets
        
        let url = URL(string: urlLink)
        let processor = RoundCornerImageProcessor(cornerRadius: 12)
        imageView.kf.setImage(with: url, options: [.processor(processor)])
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
        
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.4
        imageView.layer.shadowOffset = CGSize(width: 2, height: 3)
        let size = CGSize(width: imageView.bounds.width, height: imageView.bounds.height)
        let rect = CGRect(origin: .zero, size: size)
        imageView.layer.shadowRadius = 3
        imageView.layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: 12).cgPath
        imageView.clipsToBounds = false
        
    }

}
