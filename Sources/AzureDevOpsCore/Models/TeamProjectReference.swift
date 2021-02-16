import Foundation

/// A shallow reference to a Team Project.
public struct TeamProjectReference: Identifiable, Decodable {

    /// Project identifier.
    public let id: UUID
    /// Project name.
    public let name: String
    /// The project's description (if any).
    public let description: String?
    /// URL to default team identity image.
    public let defaultTeamImageURL: URL?
    /// Project state.
    public let state: ProjectState
    /// Project revision.
    public let revision: Int
    /// Project visibility.
    public let visibility: ProjectVisibility
    /// Project last updated date.
    public let updatedAt: Date

}

extension TeamProjectReference {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case defaultTeamImageURL = "defaultTeamImageUrl"
        case state
        case revision
        case visibility
        case updatedAt = "lastUpdateTime"
    }

}
