import Foundation

enum PipelineEndpoint {

    case list(projectID: TeamProject.ID)
    case get(pipelineID: Pipeline.ID, projectID: TeamProject.ID)

}

extension PipelineEndpoint: Endpoint {

    var path: URL {
        switch self {
        case .list(let projectID):
            return URL(string: "/\(projectID.uuidString.lowercased())/_apis/pipelines?api-version=6.1-preview.1")!

        case .get(let pipelineID, let projectID):
            return URL(string: "/\(projectID.uuidString.lowercased())/_apis/pipelines/"
                       + "\(pipelineID)?api-version=6.1-preview.1")!
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
