import Foundation

protocol Endpoint {

    var path: URL { get }
    var method: HTTPMethod { get }

}
