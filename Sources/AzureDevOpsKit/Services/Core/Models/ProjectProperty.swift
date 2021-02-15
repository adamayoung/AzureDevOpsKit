import Foundation

/// A named value associated with a project.
public struct ProjectProperty: Identifiable, Decodable {

    /// Alias for the name of the property.
    public var id: String {
        name
    }

    /// The name of the property.
    public let name: String
    /// The value of the property.
    public let value: String

}
