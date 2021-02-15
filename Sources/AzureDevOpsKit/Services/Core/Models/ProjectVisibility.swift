import Foundation

/// Indicates whom a project is visible to.
public enum ProjectVisibility: String, Decodable {
    /// The project is only visible to users with explicit access.
    case `private`
    /// The project is visible to all.
    case `public`
}
