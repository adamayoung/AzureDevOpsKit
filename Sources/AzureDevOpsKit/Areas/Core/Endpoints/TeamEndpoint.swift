import Foundation

enum TeamEndpoint {

    case listAll
    case list(projectID: TeamProject.ID)
    case get(teamID: Team.ID, projectID: TeamProject.ID)
    case getTeamMembers(teamID: Team.ID, projectID: TeamProject.ID)

}

extension TeamEndpoint: Endpoint {

    var path: URL {
        switch self {
        case .listAll:
            return URL(string: "/teams?api-version=6.1-preview.3")!

        case .list(let projectID):
            return URL(string: "/projects/\(projectID.uuidString.lowercased())/teams?api-version=6.1-preview.3")!

        case .get(let projectID, let teamID):
            return URL(string: "/projects/\(projectID.uuidString.lowercased())/teams/"
                        + "\(teamID.uuidString.lowercased())?api-version=6.1-preview.3")!

        case .getTeamMembers(let projectID, let teamID):
            return URL(string: "/projects/\(projectID.uuidString.lowercased())/teams/"
                        + "\(teamID.uuidString.lowercased())/members?api-version=6.1-preview.2")!
        }
    }

    var method: HTTPMethod {
        switch self {
        case .listAll:
            return .get

        case .list:
            return .get

        case .get:
            return .get

        case .getTeamMembers:
            return .get
        }
    }

}
