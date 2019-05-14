import UIKit
import SwiftyJSON

struct Person {
    var firstName : String = ""
    var lastName : String = ""
    var yearOfBirth : Int = 1
    var parti : String = ""
    var urlLink : String = ""
    var gender : String = ""
    var status : String = ""
    var imageMax : String = ""
    var valkrets : String = ""
    var uppdrag : String = ""
    var uppgift : String = ""
    
    func fullName () -> String {
        return "\(self.firstName) \(self.lastName)"
    }
    
    func age () -> String {
        let personAge = 2019 - yearOfBirth
        return String(personAge)
    }
    
}


struct Image {
    let image: UIImage = UIImage()
}

extension Person {
    init(json: JSON) {
        self.firstName = json["tilltalsnamn"].stringValue
        self.gender = json["kon"].stringValue
        self.parti = json["parti"].stringValue
        self.status = json["status"].stringValue
        self.lastName = json["efternamn"].stringValue
        self.imageMax = json["bild_url_max"].stringValue
        self.yearOfBirth = json["fodd_ar"].intValue
        self.urlLink = json["bild_url_192"].stringValue
        self.valkrets = json["valkrets"].stringValue
        self.uppdrag = json["personuppdrag"]["uppdrag"][0]["roll_kod"].stringValue
        self.uppgift = json["personuppgift"]["uppgift"][0]["kod"].stringValue
    }
}

