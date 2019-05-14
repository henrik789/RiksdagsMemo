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
        let firstName = json["tilltalsnamn"].stringValue
        let gender = json["kon"].stringValue
        let parti = json["parti"].stringValue
        let status = json["status"].stringValue
        let lastName = json["efternamn"].stringValue
        let imageMax = json["bild_url_max"].stringValue
        let yearOfBirth = json["fodd_ar"].intValue
        let urlLink = json["bild_url_192"].stringValue
        let valkrets = json["valkrets"].stringValue
        let uppdrag = json["personuppdrag"]["uppdrag"][0]["roll_kod"].stringValue
        let uppgift = json["personuppgift"]["uppgift"][0]["kod"].stringValue
        
        self = Person(firstName: firstName, lastName: lastName, yearOfBirth: yearOfBirth, parti: parti, urlLink: urlLink, gender: gender, status: status, imageMax: imageMax, valkrets: valkrets, uppdrag: uppdrag, uppgift: uppgift)
    }
}

