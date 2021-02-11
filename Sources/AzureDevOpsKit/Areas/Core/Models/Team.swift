import Foundation

public struct Team: Identifiable {

    public let id: UUID
    public let name: String
    public let description: String
    public let identityURL: URL
    public let projectName: String
    public let projectID: UUID

}

extension Team: Decodable {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case identityURL = "identityUrl"
        case projectName
        case projectID = "projectId"
    }

}
