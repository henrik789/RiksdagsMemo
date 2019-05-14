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
    
    
    func getPersonsData(completion: @escaping ([Person], Error?) -> Void) {
        
        Alamofire.request(jsonUrlString, method: .get).validate().responseJSON {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json["personlista"]["@hits"].intValue)
                for index in 0..<json["personlista"]["@hits"].intValue {
                    self.person.firstName = json["personlista"]["person"][index]["tilltalsnamn"].stringValue
                    self.person.gender = json["personlista"]["name"][index]["kon"].stringValue
                    self.person.parti = json["personlista"]["person"][index]["parti"].stringValue
                    self.person.status = json["personlista"]["person"][index]["status"].stringValue
                    self.person.lastName = json["personlista"]["person"][index]["efternamn"].stringValue
                    self.person.imageMax = json["personlista"]["person"][index]["bild_url_max"].stringValue
                    self.person.yearOfBirth = json["personlista"]["person"][index]["fodd_ar"].intValue
                    self.person.urlLink = json["personlista"]["person"][index]["bild_url_192"].stringValue
                    self.person.valkrets = json["personlista"]["person"][index]["valkrets"].stringValue
                    self.person.uppdrag = json["personlista"]["person"][index]["personuppdrag"]["uppdrag"][0]["roll_kod"].stringValue
                    self.person.uppgift = json["personlista"]["person"][index]["personuppgift"]["uppgift"][0]["kod"].stringValue
                    
                    let newPerson = Person(firstName: self.person.firstName, lastName: self.person.lastName, yearOfBirth: self.person.yearOfBirth, parti: self.person.parti, urlLink: self.person.urlLink, gender: self.person.gender, status: self.person.status, imageMax: self.person.imageMax, valkrets: self.person.valkrets, uppdrag: self.person.uppdrag, uppgift: self.person.uppgift)
                    self.personList.append(newPerson)
                }
                completion(self.personList, nil)
            case .failure(let error):
                print(error)
                completion([], error)
            }
        }
        
        
    }
    
    
    func updatePersonsData(json : JSON, completion: @escaping ([Person]) -> Void) {
        
        for index in 0..<5{
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
            
            //            print("Uppdrag är: " , newPerson)
            completion(personList)
            
        }
    }
    
    
}


