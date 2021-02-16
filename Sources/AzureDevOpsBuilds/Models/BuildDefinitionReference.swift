import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

/// Represents a reference to a build definition.
public struct BuildDefinitionReference: Identifiable, Decodable {

    /// The ID of the referenced definition.
    public let id: Int
    /// The name of the referenced definition.
    public let name: String
    /// The folder path of the definition.
    public let path: String
    /// The type of the definition.
    public let type: DefinitionType
    /// A value that indicates whether builds can be queued against this definition.
    public let queueStatus: DefinitionQueueStatus
    /// The definition revision number.
    public let revision: Int
    /// The quality of the definition document (draft, etc.).
    public let quality: DefinitionQuality
    /// A value that indicates whether builds can be queued against this definition.
    public let queue: DefinitionQueueStatus
    /// A reference to the project.
    public let project: TeamProjectReference
    /// The list of drafts associated with this definition, if this is not a draft definition.
    public let drafts: [DefinitionReference]
    /// The author of the definition.
    public let authoredBy: IdentityReference
    /// The date this version of the definition was created.
    public let createdAt: Date
    /// The class to represent a collection of REST reference links.
    public let links: ReferenceLinks

}

extension BuildDefinitionReference {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case path
        case type
        case queueStatus
        case revision
        case quality
        case queue
        case project
        case drafts
        case authoredBy
        case createdAt = "createdDate"
        case links = "_links"
    }

}
