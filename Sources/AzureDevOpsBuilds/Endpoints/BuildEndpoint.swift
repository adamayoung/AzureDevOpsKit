import AzureDevOpsClient
import AzureDevOpsCore
import Foundation

enum BuildEndpoint {
    case list(projectID: TeamProject.ID)
    case get(buildID: Build.ID, projectID: TeamProject.ID)
}

extension BuildEndpoint: Endpoint {

    var path: URL {
        switch self {
        case .list(let projectID):
            return URL(uuid: projectID)!
                .appendingPathComponent("_apis")
                .appendingPathComponent("build")
                .appendingPathComponent("builds")
                .appendingAPIVersion(major: 6, minor: 1, preview: 6)

        case .get(let buildID, let projectID):
            return URL(uuid: projectID)!
                .appendingPathComponent("_apis")
                .appendingPathComponent("build")
                .appendingPathComponent("builds")
                .appendingPathComponent(buildID)
                .appendingAPIVersion(major: 6, minor: 1, preview: 6)
        }
    }

    var method: HTTPMethod {
        switch self {
        case .list:
            return .get

        case .get:
            return .get
        }
    }

}
