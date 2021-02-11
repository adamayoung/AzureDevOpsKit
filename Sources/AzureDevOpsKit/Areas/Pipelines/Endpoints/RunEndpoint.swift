import Foundation

enum RunEndpoint {

    case list(pipelineID: Pipeline.ID, projectID: TeamProject.ID)
    case get(runID: Run.ID, pipelineID: Pipeline.ID, projectID: TeamProject.ID)

}

extension RunEndpoint: Endpoint {

    var path: URL {
        switch self {
        case .list(let pipelineID, let projectID):
            return URL(string: "/\(projectID.uuidString.lowercased())/_apis/pipelines/\(pipelineID)"
                       + "/runs?api-version=6.1-preview.1")!

        case .get(let runID, let pipelineID, let projectID):
            return URL(string: "/\(projectID.uuidString.lowercased())/_apis/pipelines/\(pipelineID)"
                       + "/runs/\(runID)?api-version=6.1-preview.1")!
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
