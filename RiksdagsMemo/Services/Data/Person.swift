import UIKit

//struct Person: Codable {
//
//    let personlista : [Person]
//    let person : pers
//
//
//}
//
//struct pers : Codable{
//    let firstName : String
//    let lastName : String
//    let yearOfBirth : Int
//    let parti : String
//    let urlLink : String
//    let gender : String
//}


struct Person {
    let firstName : String
    let lastName : String
    let yearOfBirth : Int
    let parti : String
    let urlLink : String
    let gender : String
    let status : String
    let imageMax : String


    init(firstName: String, lastName: String, yearOfBirth: String, parti: String, urlLink: String, gender: String, status: String, imageMax: String){

        self.firstName = firstName
        self.lastName = lastName
        self.yearOfBirth = Int(yearOfBirth)!
        self.parti = parti
        self.urlLink = urlLink
        self.gender = gender
        self.status = status
        self.imageMax = imageMax
    }

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


