import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

protocol LogRepository {

    func fetchAll(forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                  userCredential: UserCredential,
                  completion: @escaping (Result<LogCollection, AzureDevOpsError>) -> Void)

    func fetch(log logID: PipelineLog.ID, forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID,
               inProject projectID: TeamProject.ID, userCredential: UserCredential,
               completion: @escaping (Result<PipelineLog, AzureDevOpsError>) -> Void)

}
