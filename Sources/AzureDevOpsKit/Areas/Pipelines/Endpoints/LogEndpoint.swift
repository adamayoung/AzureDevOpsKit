import Foundation

enum LogEndpoint {

    case list(runID: Run.ID, pipelineID: Pipeline.ID, projectID: TeamProject.ID)
    case get(logID: Log.ID, runID: Run.ID, pipelineID: Pipeline.ID, projectID: TeamProject.ID)

}

extension LogEndpoint: Endpoint {

    var path: URL {
        switch self {
        case .list(let runID, let pipelineID, let projectID):
            return URL(string: "/\(projectID.uuidString.lowercased())/_apis/pipelines/\(pipelineID)/runs/"
                       + "\(runID)/logs?api-version=6.1-preview.1")!

        case .get(let logID, let runID, let pipelineID, let projectID):
            return URL(string: "/\(projectID.uuidString.lowercased())/_apis/pipelines/\(pipelineID)/runs/"
                       + "\(runID)/logs/\(logID)?api-version=6.1-preview.1")!
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
