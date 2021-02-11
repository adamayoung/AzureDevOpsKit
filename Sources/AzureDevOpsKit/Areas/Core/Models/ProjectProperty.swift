import Foundation

public struct ProjectProperty: Identifiable {

    public var id: String {
        name
    }

    public let name: String
    public let value: String

}

extension ProjectProperty: Decodable { }
