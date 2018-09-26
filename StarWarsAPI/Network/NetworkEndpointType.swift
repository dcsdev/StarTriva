import Foundation
import Alamofire

typealias requestHeaders = [String:String]

//Protocol definition for a single network endpoint
//At minimum, an end point should should h ave a url and a path
protocol NetworkEndPoint {
    var requestUrl      : URL { get };
    var requestPath     : String{ get };
    var requestMethod   : HTTPRequestMethod { get};
}
