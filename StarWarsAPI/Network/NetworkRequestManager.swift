import Foundation
import SwiftyJSON

struct NetworkRequestManager {
    
    private let networkRouter = NetworkRouter<SWAPI>()
    
    func getGeneric<T: Decodable>(forEndpoint endPoint: SWAPI, completion: @escaping (T?, _ error: Error?) ->()) {
        
        networkRouter.request(route: endPoint) { (json, error) in
            do {
                let decodedObj = try JSONDecoder().decode(T.self, from: (json.rawData()))
                completion(decodedObj, nil);
            } catch {
                completion(nil, error)
            }
        }
    }
}
