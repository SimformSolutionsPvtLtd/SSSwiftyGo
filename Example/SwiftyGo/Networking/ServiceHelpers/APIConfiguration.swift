
import Foundation
import Alamofire

protocol APIConfiguration {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var host: String { get }
}
extension APIConfiguration {
    var host: String {
        return ""
    }
    func returnUrl() -> URL {
        URL(string: host + path) ?? URL(string: "")!
    }
    
}
