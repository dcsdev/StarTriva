import Foundation

//SWAPI enum indicates each individual endpoint
//there is one static URL that allows any url to be passed,
//such as a specific person or vechicle
public enum SWAPI {
    case person(id:Int)
    case vehicle(id:Int)
    case starship(id:Int)
    case film(id:Int)
    case planet(id:Int)
    case species(id:Int)
    case staticURL(url: String)
}

extension SWAPI: NetworkEndPoint {
    
    var requestMethod: HTTPRequestMethod {
        return HTTPRequestMethod.get
    }
    
    var requestUrl: URL {
        return URL(string: "https://swapi.co/api/")!
    }
    
    var requestPath: String {
        switch self {
        case .person(let id):
            return "people/\(id)"
        case .vehicle(let id):
            return "vehicle/\(id)"
        case .starship(let id):
            return "starships/\(id)"
        case .film(let id):
            return "films/\(id)"
        case .planet(let id):
            return "planets/\(id)"
        case .species(let id):
            return "species/\(id)"
        case .staticURL(let url):
            return url.replacingOccurrences(of: "https://swapi.co/api/", with: "")
        }
    }
}
