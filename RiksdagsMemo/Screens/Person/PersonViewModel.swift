
import UIKit

class PersonViewModel {
    let dataManager: DataManager
    private(set) var persons: [Person] = []
    //    private(set) var images: [Image] = []
    private(set) var image = UIImage()
    let title = "Persons"
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func updatePersons(completion: @escaping (Error?) -> Void) {
        dataManager.getPersons { (persons, error) in
            print("- -  checking - -")
            guard error == nil else {
                dispatchOnMain(completion, with: error)
                return
            }
            self.persons = persons
            
            dispatchOnMain(completion, with: nil)
            print("hej")
        }
    }
    
    func updateImages(completion: @escaping (Error?) -> Void) {
        dataManager.getImages { (image, error) in
            guard error == nil else {
                dispatchOnMain(completion, with: error)
                return
            }
            self.image = image
            dispatchOnMain(completion, with: error)
        }
    }
    
}

public func dispatchOnMain<T>(_ block: @escaping (T)->Void, with parameters: T) {
    DispatchQueue.main.async {
        block(parameters)
    }
}
