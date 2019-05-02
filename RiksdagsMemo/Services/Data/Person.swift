import UIKit

//struct Person: Codable {
//    let name: String
//    let username: String
//    let phone: String
//    let email: String
//}

struct Person {
    let firstName : String
    let lastName : String
    let yearOfBirth : Int
    let parti : String
    let urlLink : String
    let gender : String
    
    
    init(firstName: String, lastName: String, yearOfBirth: String, parti: String, urlLink: String, gender: String){
        
        self.firstName = firstName
        self.lastName = lastName
        self.yearOfBirth = Int(yearOfBirth)!
        self.parti = parti
        self.urlLink = urlLink
        self.gender = gender
    }
    
    func fullName () -> String {
        return "\(self.firstName) \(self.lastName)"
    }
    
}

struct Image {
    let image: UIImage = UIImage()
}


