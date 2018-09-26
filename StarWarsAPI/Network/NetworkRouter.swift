import Foundation
import Alamofire
import SwiftyJSON

class NetworkRouter<EndPoint: NetworkEndPoint> : NetworkRouting {
    func request(route : EndPoint, completion: @escaping NetworkRoutingCompletion) {
        do {
            let requestURL      = URL(string: route.requestUrl.absoluteString + route.requestPath)
            
            Alamofire.request(requestURL!).responseJSON { response in
                
                if let json             = response.result.value {
                    let jsonResponse    = JSON(json);
                    completion(jsonResponse, nil);
                }
            }
        }
    }
}
