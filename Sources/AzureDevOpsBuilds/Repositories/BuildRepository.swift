import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

protocol BuildRepository {

    func fetchAll(inProject projectID: TeamProject.ID, userCredential: UserCredential,
                  completion: @escaping (Result<List<Build>, AzureDevOpsError>) -> Void)

    func fetch(build buildID: Build.ID, inProject projectID: TeamProject.ID, userCredential: UserCredential,
               completion: @escaping (Result<Build, AzureDevOpsError>) -> Void)

}
