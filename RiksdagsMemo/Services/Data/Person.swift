import UIKit

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


