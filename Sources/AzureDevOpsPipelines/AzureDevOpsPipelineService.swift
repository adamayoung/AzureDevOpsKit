import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

public final class AzureDevOpsPipelineService: PipelineService {

    private let userCredential: UserCredential
    private let pipelineRepository: PipelineRepository
    private let runRepository: RunRepository
    private let logRepository: LogRepository


    init(userCredential: UserCredential, pipelineRepository: PipelineRepository, runRepository: RunRepository,
         logRepository: LogRepository) {
        self.userCredential = userCredential
        self.pipelineRepository = pipelineRepository
        self.runRepository = runRepository
        self.logRepository = logRepository
    }

    public convenience init(userCredential: UserCredential) {
        let pipelineRepository = PipelineHTTPRepository()
        let runRepository = RunHTTPRepository()
        let logRepository = LogHTTPRepository()

        self.init(userCredential: userCredential, pipelineRepository: pipelineRepository, runRepository: runRepository,
                  logRepository: logRepository)
    }

    public func fetchAllPipelines(inProject projectID: TeamProject.ID,
                                  completion: @escaping (Result<[Pipeline], AzureDevOpsError>) -> Void) {
        pipelineRepository.fetchAll(inProject: projectID, userCredential: userCredential) { result in
            completion(result.map(\.value))
        }
    }

    public func fetch(pipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                      completion: @escaping (Result<Pipeline, AzureDevOpsError>) -> Void) {
        pipelineRepository.fetch(pipeline: pipelineID, inProject: projectID, userCredential: userCredential,
                                 completion: completion)
    }

    public func fetchAllRuns(forPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                             completion: @escaping (Result<[Run], AzureDevOpsError>) -> Void) {
        runRepository.fetchAll(forPipeline: pipelineID, inProject: projectID,
                               userCredential: userCredential) { result in
            completion(result.map(\.value))
        }
    }

    public func fetch(run runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                      completion: @escaping (Result<Run, AzureDevOpsError>) -> Void) {
        runRepository.fetch(run: runID, inPipeline: pipelineID, inProject: projectID, userCredential: userCredential,
                            completion: completion)
    }

    public func fetchLogs(forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                          completion: @escaping (Result<[PipelineLog], AzureDevOpsError>) -> Void) {
        logRepository.fetchAll(forRun: runID, inPipeline: pipelineID, inProject: projectID,
                               userCredential: userCredential) { result in
            completion(result.map(\.logs))
        }
    }

    public func fetch(log logID: PipelineLog.ID, forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID,
                      inProject projectID: TeamProject.ID,
                      completion: @escaping (Result<PipelineLog, AzureDevOpsError>) -> Void) {
        logRepository.fetch(log: logID, forRun: runID, inPipeline: pipelineID, inProject: projectID,
                            userCredential: userCredential, completion: completion)
    }

}
