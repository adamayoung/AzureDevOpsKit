import Foundation

/// A Project Team.
public struct Team: Identifiable, Decodable {

    /// Team (Identity) Guid. A Team Foundation ID.
    public let id: UUID
    /// Team name.
    public let name: String
    /// Team description.
    public let description: String
    /// Identity REST API URL to this team.
    public let identityURL: URL
    /// Project ID which this team belongs to.
    public let projectID: UUID
    /// Project name which this team belongs to.
    public let projectName: String

}

extension Team {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case identityURL = "identityUrl"
        case projectName
        case projectID = "projectId"
    }

}
