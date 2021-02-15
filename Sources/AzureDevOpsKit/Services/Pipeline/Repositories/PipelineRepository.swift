import Foundation

protocol PipelineRepository {

    func fetchAll(inProject projectID: TeamProject.ID,
                  completion: @escaping (Result<List<Pipeline>, AzureDevOpsError>) -> Void)

    func fetch(pipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Pipeline, AzureDevOpsError>) -> Void)

}

final class PipelineHTTPRepository: PipelineRepository {

    private let client: Client

    init(client: Client = HTTPClient()) {
        self.client = client
    }

    func fetchAll(inProject projectID: TeamProject.ID,
                  completion: @escaping (Result<List<Pipeline>, AzureDevOpsError>) -> Void) {
        client.request(PipelineEndpoint.list(projectID: projectID), completion: completion)
    }

    func fetch(pipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Pipeline, AzureDevOpsError>) -> Void) {
        client.request(PipelineEndpoint.get(pipelineID: pipelineID, projectID: projectID), completion: completion)
    }

}
