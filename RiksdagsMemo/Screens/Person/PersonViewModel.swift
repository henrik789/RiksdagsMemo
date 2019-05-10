
import UIKit

class PersonViewModel {
    let dataManager: DataManager
    private(set) var persons: [Person] = []
    let title = "Riksdagsledamöter"
    let jsonUrlString = "http://data.riksdagen.se/personlista/?iid=&fnamn=&enamn=&f_ar=&kn=&parti=&valkrets=&rdlstatus=&org=&utformat=json&termlista="
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    
    func updatePersons(completion: @escaping (Error?) -> Void) {
        dataManager.getPersonsData(url: jsonUrlString)
    }
}
//    func updatePersons(completion: @escaping (Error?) -> Void) {
//        dataManager.getAllData{ (persons, error) in
//            print("- -  checking - -")
//            guard error == nil else {
//                dispatchOnMain(completion, with: error)
//                return
//            }
//            self.persons = persons
//            print(persons.count)
//            dispatchOnMain(completion, with: nil)
//        }
//    }

//    func updatePersons(completion: @escaping (Error?) -> Void) {
//        dataManager.getPersons { (persons, error) in
//            print("- -  checking - -")
//            guard error == nil else {
//                dispatchOnMain(completion, with: error)
//                return
//            }
//            self.persons = persons
//
//            dispatchOnMain(completion, with: nil)
//            print("hej")
//        }
//    }


public func dispatchOnMain<T>(_ block: @escaping (T)->Void, with parameters: T) {
    DispatchQueue.main.async {
        block(parameters)
    }
}
