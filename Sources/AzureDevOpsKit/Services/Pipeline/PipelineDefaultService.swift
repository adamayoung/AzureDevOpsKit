import Foundation

final class PipelineDefaultService: PipelineService {

    private let pipelineRepository: PipelineRepository
    private let runRepository: RunRepository
    private let logRepository: LogRepository

    init(pipelineRepository: PipelineRepository = PipelineHTTPRepository(),
         runRepository: RunRepository = RunHTTPRepository(), logRepository: LogRepository = LogHTTPRepository()) {
        self.pipelineRepository = pipelineRepository
        self.runRepository = runRepository
        self.logRepository = logRepository
    }

    func fetchAllPipelines(inProject projectID: TeamProject.ID,
                           completion: @escaping (Result<[Pipeline], AzureDevOpsError>) -> Void) {
        pipelineRepository.fetchAll(inProject: projectID) { result in
            completion(result.map(\.value))
        }
    }

    func fetch(pipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Pipeline, AzureDevOpsError>) -> Void) {
        pipelineRepository.fetch(pipeline: pipelineID, inProject: projectID, completion: completion)
    }

    func fetchAllRuns(forPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                      completion: @escaping (Result<[Run], AzureDevOpsError>) -> Void) {
        runRepository.fetchAll(forPipeline: pipelineID, inProject: projectID) { result in
            completion(result.map(\.value))
        }
    }

    func fetch(run runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Run, AzureDevOpsError>) -> Void) {
        runRepository.fetch(run: runID, inPipeline: pipelineID, inProject: projectID, completion: completion)
    }

    func fetchLogs(forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                   completion: @escaping (Result<[PipelineLog], AzureDevOpsError>) -> Void) {
        logRepository.fetchAll(forRun: runID, inPipeline: pipelineID, inProject: projectID) { result in
            completion(result.map(\.logs))
        }
    }

    func fetch(log logID: PipelineLog.ID, forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID,
               inProject projectID: TeamProject.ID, completion: @escaping (Result<PipelineLog, AzureDevOpsError>) -> Void) {
        logRepository.fetch(log: logID, forRun: runID, inPipeline: pipelineID, inProject: projectID,
                            completion: completion)
    }

}
