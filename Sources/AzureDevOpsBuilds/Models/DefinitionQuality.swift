import Foundation

/// The quality of the definition document (draft, etc.).
public enum DefinitionQuality: String, Decodable {
    /// Definition.
    case definition
    /// Draft.
    case draft
}
