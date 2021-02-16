import AzureDevOpsClient
import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

final class RunHTTPRepository: RunRepository {

    private let client: Client

    init(client: Client = HTTPClient()) {
        self.client = client
    }

    func fetchAll(forPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                  userCredential: UserCredential, completion: @escaping (Result<List<Run>, AzureDevOpsError>) -> Void) {
        client.request(RunEndpoint.list(pipelineID: pipelineID, projectID: projectID), userCredential: userCredential,
                       completion: completion)
    }

    func fetch(run runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
               userCredential: UserCredential, completion: @escaping (Result<Run, AzureDevOpsError>) -> Void) {
        client.request(RunEndpoint.get(runID: runID, pipelineID: pipelineID, projectID: projectID),
                       userCredential: userCredential, completion: completion)
    }

}
