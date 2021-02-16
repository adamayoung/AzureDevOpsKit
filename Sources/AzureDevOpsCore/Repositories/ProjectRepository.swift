import AzureDevOpsShared
import Foundation

protocol ProjectRepository {

    func fetchAll(parameters: FetchAllProjectsParameters?, userCredential: UserCredential,
                  completion: @escaping (Result<List<TeamProjectReference>, AzureDevOpsError>) -> Void)

    func fetch(project projectID: TeamProject.ID, parameters: FetchProjectParameters?, userCredential: UserCredential,
               completion: @escaping (Result<TeamProject, AzureDevOpsError>) -> Void)

    func fetchProperties(forProject projectID: TeamProject.ID, parameters: FetchProjectPropertiesParameters?,
                         userCredential: UserCredential,
                         completion: @escaping (Result<List<ProjectProperty>, AzureDevOpsError>) -> Void)

}
