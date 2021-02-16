import AzureDevOpsShared
import Foundation

/// Represents a Team Project.
public struct TeamProject: Identifiable, Decodable {

    /// Project identifier.
    public let id: UUID
    /// Project name.
    public let name: String
    /// Project abbreviation.
    public let abbreviation: String?
    /// The project's description (if any).
    public let description: String?
    /// Project state.
    public let state: ProjectState
    /// Project revision.
    public let revision: Int
    /// Project visibility.
    public let visibility: ProjectVisibility
    /// Shallow ref to the default team.
    public let defaultTeam: TeamReference
    /// URL to default team identity image.
    public let defaultTeamImageURL: URL?
    /// Project last updated date.
    public let updatedAt: Date
    /// The links to other objects related to this object.
    public let links: ReferenceLinks

}

extension TeamProject {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case abbreviation
        case description
        case state
        case revision
        case visibility
        case defaultTeam
        case defaultTeamImageURL = "defaultTeamImageUrl"
        case updatedAt = "lastUpdateTime"
        case links = "_links"
    }

}
