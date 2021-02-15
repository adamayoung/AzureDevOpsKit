import Foundation

protocol LogRepository {

    func fetchAll(forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                  completion: @escaping (Result<LogCollection, AzureDevOpsError>) -> Void)

    func fetch(log logID: PipelineLog.ID, forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID,
               inProject projectID: TeamProject.ID, completion: @escaping (Result<PipelineLog, AzureDevOpsError>) -> Void)

}

final class LogHTTPRepository: LogRepository {

    private let client: Client

    init(client: Client = HTTPClient()) {
        self.client = client
    }

    func fetchAll(forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                  completion: @escaping (Result<LogCollection, AzureDevOpsError>) -> Void) {
        client.request(LogEndpoint.list(runID: runID, pipelineID: pipelineID, projectID: projectID),
                       completion: completion)
    }

    func fetch(log logID: PipelineLog.ID, forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID,
               inProject projectID: TeamProject.ID, completion: @escaping (Result<PipelineLog, AzureDevOpsError>) -> Void) {
        client.request(LogEndpoint.get(logID: logID, runID: runID, pipelineID: pipelineID, projectID: projectID),
                       completion: completion)
    }
    
}
