import Foundation

enum ProjectEndpoint {
    case list(parameters: FetchAllProjectsParameters? = nil)
    case get(projectID: TeamProject.ID, parameters: FetchProjectParameters? = nil)
    case properties(projectID: TeamProject.ID, parameters: FetchProjectPropertiesParameters? = nil)
}

extension ProjectEndpoint: Endpoint {

    var path: URL {
        switch self {
        case .list(let parameters):
            return URL(string: "/_apis/projects")!
                .appendingParameters(parameters)
                .appendingAPIVersion(major: 6, minor: 1, preview: 4)

        case .get(let projectID, let parameters):
            return URL(string: "/_apis/projects")!
                .appendingPathComponent(projectID)
                .appendingParameters(parameters)
                .appendingAPIVersion(major: 6, minor: 1, preview: 4)

        case .properties(let projectID, let parameters):
            return URL(string: "/_apis/projects")!
                .appendingPathComponent(projectID)
                .appendingPathComponent("properties")
                .appendingParameters(parameters)
                .appendingAPIVersion(major: 6, minor: 1, preview: 4)
        }
    }

    var method: HTTPMethod {
        switch self {
        case .list:
            return .get

        case .get:
            return .get

        case .properties:
            return .get
        }
    }

}
