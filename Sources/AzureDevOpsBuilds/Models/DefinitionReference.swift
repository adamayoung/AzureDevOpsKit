import AzureDevOpsCore
import Foundation

/// Represents a reference to a definition.
public struct DefinitionReference: Identifiable, Decodable {

    /// The ID of the referenced definition.
    public let id: Int
    /// The name of the referenced definition.
    public let name: String
    /// The folder path of the definition.
    public let path: String
    /// The definition revision number.
    public let revision: Int
    /// A reference to the project.
    public let project: TeamProjectReference
    /// A value that indicates whether builds can be queued against this definition.
    public let queueStatus: DefinitionQueueStatus
    /// The type of the definition.
    public let type: DefinitionType

}
