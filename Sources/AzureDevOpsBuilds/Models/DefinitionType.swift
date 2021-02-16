import Foundation

/// The type of the definition.
public enum DefinitionType: String, Decodable {
    /// Build.
    case build
    /// XAML.
    case xaml
}
