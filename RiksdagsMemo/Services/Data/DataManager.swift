import UIKit

private let badResponseError = NSError(domain: "Bad network response", code: 2, userInfo: nil)
// Handle all data
class  DataManager {
    var list = [Person]()
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getAllData(completion : @escaping ([Person], Error?)->()){

        let jsonUrlString = "http://data.riksdagen.se/personlista/?iid=&fnamn=&enamn=&f_ar=&kn=&parti=&valkrets=&rdlstatus=&org=&utformat=json&termlista="

        guard let url = URL(string: jsonUrlString) else
        {return}

        URLSession.shared.dataTask(with: url) { (data, respons, error) in


            if let error = error{
                completion([], error)
            }


            guard let data = data else {return}

            do{
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else {return}

                if let data = json["personlista"] as? [String : Any]{

                    if let personer = data["person"] as? [Any]{

                        for (index, person) in personer.enumerated(){
                            if let person = person as? [String : Any] {

                                if let firstName = person["tilltalsnamn"] as? String,
                                    let lastName = person["efternamn"] as? String,
                                    let yearOfBirth = person["fodd_ar"] as? String,
                                    let parti = person["parti"] as? String,
                                    let urlLink = person["bild_url_192"] as? String,
                                    let gender = person["kon"] as? String {

                                    let newPerson = Person(firstName: firstName, lastName: lastName, yearOfBirth: yearOfBirth, parti: parti, urlLink: urlLink, gender: gender)
                                    self.list.append(newPerson)
                                    if index == personer.count-1{
                                        completion(self.list, nil)
                                    }

                                }
                            }
                        }

                    }
                }
                //self.genderBalance()
            }
            catch{
                print("error serialization")
            }

            }.resume()
    }
    
    
    
//    func getPersons(completion: @escaping ([Person], Error?) -> Void) {
//        networkService.addRequest(.getPersons) { (data, response, error)  in
//            guard let data = data , error == nil else {
//                let error = error ?? badResponseError
//                completion([] ,error)
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                print(data)
//                let userList = try decoder.decode([Person].self, from: data)
//                completion(userList, nil)
//            } catch {
//                completion([], error)
//            }
//        }
//
//    }
    

    
}
