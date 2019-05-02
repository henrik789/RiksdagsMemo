import Foundation

enum Request {
    case getPersons
    case getImages
    case getBigImages
}

extension Request {
    var url: URL {
        switch self {
        case .getImages:
            return URL(string: "https://picsum.photos/60/?random")!
        case .getBigImages:
            return URL(string: "https://picsum.photos/400/?random")!
        case .getPersons:
            return URL(string: "http://data.riksdagen.se/personlista/?iid=&fnamn=&enamn=&f_ar=&kn=&parti=&valkrets=&rdlstatus=&org=&utformat=json&termlista=")!
        }
    }
}


//"https://jsonplaceholder.typicode.com/users"
