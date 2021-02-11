import Foundation

final class PipelineHTTPService: PipelineService {

    private let client: Client

    init(client: Client) {
        self.client = client
    }

    func fetchAllPipelines(inProject projectID: TeamProject.ID,
                           completion: @escaping (Result<[Pipeline], AzureDevOpsError>) -> Void) {
        let endpoint = PipelineEndpoint.list(projectID: projectID)
        client.send(endpoint) { (result: Result<List<Pipeline>, AzureDevOpsError>) in
            switch result {
            case .success(let pipelineList):
                completion(.success(pipelineList.value))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetch(pipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Pipeline, AzureDevOpsError>) -> Void) {
        let endpoint = PipelineEndpoint.get(pipelineID: pipelineID, projectID: projectID)
        client.send(endpoint, completion: completion)
    }

    func fetchAllRuns(forPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                      completion: @escaping (Result<[Run], AzureDevOpsError>) -> Void) {
        let endpoint = RunEndpoint.list(pipelineID: pipelineID, projectID: projectID)
        client.send(endpoint) { (result: Result<List<Run>, AzureDevOpsError>) in
            switch result {
            case .success(let runList):
                completion(.success(runList.value))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetch(run runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Run, AzureDevOpsError>) -> Void) {
        let endpoint = RunEndpoint.get(runID: runID, pipelineID: pipelineID, projectID: projectID)
        client.send(endpoint, completion: completion)
    }

    func fetchLogs(forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                   completion: @escaping (Result<[Log], AzureDevOpsError>) -> Void) {
        let endpoint = LogEndpoint.list(runID: runID, pipelineID: pipelineID, projectID: projectID)
        client.send(endpoint) { (result: Result<LogCollection, AzureDevOpsError>) in
            switch result {
            case .success(let logCollection):
                completion(.success(logCollection.logs))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetch(log logID: Log.ID, forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID,
               inProject projectID: TeamProject.ID, completion: @escaping (Result<Log, AzureDevOpsError>) -> Void) {
        let endpoint = LogEndpoint.get(logID: logID, runID: runID, pipelineID: pipelineID, projectID: projectID)
        client.send(endpoint, completion: completion)
    }

}
