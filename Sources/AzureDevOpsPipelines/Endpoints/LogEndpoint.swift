import AzureDevOpsCore
import AzureDevOpsClient
import Foundation

enum LogEndpoint {
    case list(runID: Run.ID, pipelineID: Pipeline.ID, projectID: TeamProject.ID)
    case get(logID: PipelineLog.ID, runID: Run.ID, pipelineID: Pipeline.ID, projectID: TeamProject.ID)
}

extension LogEndpoint: Endpoint {

    var path: URL {
        switch self {
        case .list(let runID, let pipelineID, let projectID):
            return URL(uuid: projectID)!
                .appendingPathComponent("_apis/pipelines")
                .appendingPathComponent(pipelineID)
                .appendingPathComponent("runs")
                .appendingPathComponent(runID)
                .appendingPathComponent("logs")
                .appendingAPIVersion(major: 6, minor: 1, preview: 1)

        case .get(let logID, let runID, let pipelineID, let projectID):
            return URL(uuid: projectID)!
                .appendingPathComponent("_apis/pipelines")
                .appendingPathComponent(pipelineID)
                .appendingPathComponent("runs")
                .appendingPathComponent(runID)
                .appendingPathComponent("logs")
                .appendingPathComponent(logID)
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
