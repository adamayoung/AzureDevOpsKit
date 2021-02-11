import Foundation

public struct TeamProject: Identifiable {

    public let id: UUID
    public let name: String
    public let abbreviation: String?
    public let description: String?
    public let state: ProjectState
    public let revision: Int
    public let visibility: ProjectVisibility
    public let defaultTeam: TeamRef
    public let defaultTeamImageURL: URL?
    public let lastUpdateTime: Date
    public let links: ReferenceLinks

}

extension TeamProject: Decodable {

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
        case lastUpdateTime
        case links = "_links"
    }

}
