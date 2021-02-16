import Foundation

public protocol Endpoint {

    var path: URL { get }
    var method: HTTPMethod { get }

}
