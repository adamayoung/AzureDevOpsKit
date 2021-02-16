import AzureDevOpsClient
import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

final class LogHTTPRepository: LogRepository {

    private let client: Client

    init(client: Client = HTTPClient()) {
        self.client = client
    }

    func fetchAll(forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                  userCredential: UserCredential,
                  completion: @escaping (Result<LogCollection, AzureDevOpsError>) -> Void) {
        client.request(LogEndpoint.list(runID: runID, pipelineID: pipelineID, projectID: projectID),
                       userCredential: userCredential, completion: completion)
    }

    func fetch(log logID: PipelineLog.ID, forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID,
               inProject projectID: TeamProject.ID, userCredential: UserCredential,
               completion: @escaping (Result<PipelineLog, AzureDevOpsError>) -> Void) {
        client.request(LogEndpoint.get(logID: logID, runID: runID, pipelineID: pipelineID, projectID: projectID),
                       userCredential: userCredential, completion: completion)
    }

}
