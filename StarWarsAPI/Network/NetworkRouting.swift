import Foundation
import Alamofire
import SwiftyJSON

public typealias NetworkRoutingCompletion = (_ response: JSON, _ error: Error?)->();

protocol NetworkRouting: class {
    associatedtype EndPoint: NetworkEndPoint
    func request(route: EndPoint, completion: @escaping NetworkRoutingCompletion);
}
