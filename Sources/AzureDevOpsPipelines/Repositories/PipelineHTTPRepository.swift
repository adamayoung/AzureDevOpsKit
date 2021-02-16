import AzureDevOpsClient
import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

final class PipelineHTTPRepository: PipelineRepository {

    private let client: Client

    init(client: Client = HTTPClient()) {
        self.client = client
    }

    func fetchAll(inProject projectID: TeamProject.ID, userCredential: UserCredential,
                  completion: @escaping (Result<List<Pipeline>, AzureDevOpsError>) -> Void) {
        client.request(PipelineEndpoint.list(projectID: projectID),
                       userCredential: userCredential, completion: completion)
    }

    func fetch(pipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID, userCredential: UserCredential,
               completion: @escaping (Result<Pipeline, AzureDevOpsError>) -> Void) {
        client.request(PipelineEndpoint.get(pipelineID: pipelineID, projectID: projectID),
                       userCredential: userCredential, completion: completion)
    }

}
