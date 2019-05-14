
import UIKit
import Kingfisher

class PersonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var valkretsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var partiSymbol: UIImageView!
    
    static var identifier: String {
        return "PersonCollectionViewCell"
    }
    
    func config(firstName: String, status: String, party: String, urlLink: String, age: String, valkrets: String){
        
        self.layer.cornerRadius = 14
        self.layer.masksToBounds = true
        fullnameLabel.text = "Namn: " + firstName
        genderLabel.text = "Ålder: " + age
        partyLabel.text = "Parti: " + party
        statusLabel.text = "Nuvarande roll: " + status
        valkretsLabel.text = "Valkrets: " + valkrets
        bgView.backgroundColor = UIColor(named: "Whiteish")
        bgView.layer.cornerRadius = 14
        bgView.layer.masksToBounds = true
        
        let url = URL(string: urlLink)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
        
//        imageView.layer.shadowColor = UIColor.black.cgColor
//        imageView.layer.shadowOpacity = 0.6
//        imageView.layer.shadowOffset = CGSize(width: 2, height: 3)
//        let size = CGSize(width: imageView.bounds.width, height: imageView.bounds.height)
//        let rect = CGRect(origin: .zero, size: size)
//        imageView.layer.shadowRadius = 3
//        imageView.layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: 12).cgPath
        imageView.layer.cornerRadius = 18
        imageView.clipsToBounds = true
        partiSymbol.layer.cornerRadius = 25
        switch party {
        case "S":
            partiSymbol.image = UIImage(named: "logo-s-large")
        case "M":
            partiSymbol.image = UIImage(named: "logo-m-large")
        case "MP":
            partiSymbol.image = UIImage(named: "logo-mp-large")
        case "L":
            partiSymbol.image = UIImage(named: "logo-l-large-ny3")
        case "SD":
            partiSymbol.image = UIImage(named: "logo-sd-large")
        case "C":
            partiSymbol.image = UIImage(named: "logo-c-large")
        case "KD":
            partiSymbol.image = UIImage(named: "logo-kd-large")
        case "V":
            partiSymbol.image = UIImage(named: "logo-v-large")

        default:
            partiSymbol.image = UIImage(contentsOfFile: "logo-c-large")
        }
    }
    
    func getPartyImage() {
        
    }

}
