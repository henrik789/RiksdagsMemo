import UIKit
import SwiftyJSON
import Alamofire


private let badResponseError = NSError(domain: "Bad network response", code: 2, userInfo: nil)

class  DataManager {
    var personList = [Person]()
    var person = Person()
    let networkService: NetworkService
    let jsonUrlString = "http://data.riksdagen.se/personlista/?iid=&fnamn=&enamn=&f_ar=&kn=&parti=&valkrets=&rdlstatus=&org=&utformat=json&termlista="
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    
    func getPersonsData(url: String) {
        
        Alamofire.request(url, method: .get).validate().responseJSON {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.updatePersonsData(json: json)
            //                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func updatePersonsData(json : JSON) {
        
        for index in 0..<349 {
            person.firstName = json["personlista"]["person"][index]["tilltalsnamn"].stringValue
            person.gender = json["personlista"]["name"][index]["kon"].stringValue
            person.parti = json["personlista"]["person"][index]["parti"].stringValue
            person.status = json["personlista"]["person"][index]["status"].stringValue
            person.lastName = json["personlista"]["person"][index]["efternamn"].stringValue
            person.imageMax = json["personlista"]["person"][index]["bild_url_max"].stringValue
            person.yearOfBirth = json["personlista"]["person"][index]["fodd_ar"].intValue
            person.urlLink = json["personlista"]["person"][index]["bild_url_192"].stringValue
            person.valkrets = json["personlista"]["person"][index]["valkrets"].stringValue
            person.uppdrag = json["personlista"]["person"][index]["personuppdrag"]["uppdrag"][0]["roll_kod"].stringValue
            person.uppgift = json["personlista"]["person"][index]["personuppgift"]["uppgift"][0]["kod"].stringValue
            
            let newPerson = Person(firstName: person.firstName, lastName: person.lastName, yearOfBirth: person.yearOfBirth, parti: person.parti, urlLink: person.urlLink, gender: person.gender, status: person.status, imageMax: person.imageMax, valkrets: person.valkrets, uppdrag: person.uppdrag, uppgift: person.uppgift)
            
            personList.append(newPerson)
            
            print(personList.count)
            print("Uppdrag är: " , newPerson)
        }
    }
    
    
}


