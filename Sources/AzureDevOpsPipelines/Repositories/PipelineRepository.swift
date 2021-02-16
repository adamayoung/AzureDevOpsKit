import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

protocol PipelineRepository {

    func fetchAll(inProject projectID: TeamProject.ID, userCredential: UserCredential,
                  completion: @escaping (Result<List<Pipeline>, AzureDevOpsError>) -> Void)

    func fetch(pipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID, userCredential: UserCredential,
               completion: @escaping (Result<Pipeline, AzureDevOpsError>) -> Void)

}
