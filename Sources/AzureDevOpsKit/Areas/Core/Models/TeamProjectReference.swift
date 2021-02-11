import Foundation

public struct TeamProjectReference: Identifiable {

    public let id: UUID
    public let name: String
    public let description: String?
    public let defaultTeamImageURL: URL?
    public let state: ProjectState
    public let revision: Int
    public let visibility: ProjectVisibility
    public let updatedAt: Date

}

extension TeamProjectReference: Decodable {

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
