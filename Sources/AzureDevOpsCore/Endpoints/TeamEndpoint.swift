import AzureDevOpsClient
import Foundation

enum TeamEndpoint {
    case listAll(parameters: FetchAllTeamsParameters? = nil)
    case list(projectID: TeamProject.ID)
    case get(teamID: Team.ID, projectID: TeamProject.ID)
    case getTeamMembers(teamID: Team.ID, projectID: TeamProject.ID)
}

extension TeamEndpoint: Endpoint {

    var path: URL {
        switch self {
        case .listAll(let parameters):
            return URL(string: "/_apis/teams")!
                .appendingParameters(parameters)
                .appendingAPIVersion(major: 6, minor: 1, preview: 3)

        case .list(let projectID):
            return URL(string: "/_apis/projects")!
                .appendingPathComponent(projectID)
                .appendingPathComponent("teams")
                .appendingAPIVersion(major: 6, minor: 1, preview: 3)

        case .get(let projectID, let teamID):
            return URL(string: "/_apis/projects")!
                .appendingPathComponent(projectID)
                .appendingPathComponent("teams")
                .appendingPathComponent(teamID)
                .appendingAPIVersion(major: 6, minor: 1, preview: 3)

        case .getTeamMembers(let projectID, let teamID):
            return URL(string: "/_apis/projects")!
                .appendingPathComponent(projectID)
                .appendingPathComponent("teams")
                .appendingPathComponent(teamID)
                .appendingPathComponent("members")
                .appendingAPIVersion(major: 6, minor: 1, preview: 2)
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
