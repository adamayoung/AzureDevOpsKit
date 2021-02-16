import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

protocol RunRepository {

    func fetchAll(forPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                  userCredential: UserCredential, completion: @escaping (Result<List<Run>, AzureDevOpsError>) -> Void)

    func fetch(run runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
               userCredential: UserCredential, completion: @escaping (Result<Run, AzureDevOpsError>) -> Void)

}
