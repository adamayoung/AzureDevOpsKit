import Foundation

enum PipelineEndpoint {
    case list(projectID: TeamProject.ID)
    case get(pipelineID: Pipeline.ID, projectID: TeamProject.ID)
}

extension PipelineEndpoint: Endpoint {

    var path: URL {
        switch self {
        case .list(let projectID):
            return URL(uuid: projectID)!
                .appendingPathComponent("_apis")
                .appendingPathComponent("pipelines")
                .appendingAPIVersion(major: 6, minor: 1, preview: 1)

        case .get(let pipelineID, let projectID):
            return URL(uuid: projectID)!
                .appendingPathComponent("_apis")
                .appendingPathComponent("pipelines")
                .appendingPathComponent(pipelineID)
                .appendingAPIVersion(major: 6, minor: 1, preview: 1)
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
