import AzureDevOpsClient
import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

final class BuildHTTPRepository: BuildRepository {

    private let client: Client

    init(client: Client = HTTPClient()) {
        self.client = client
    }

    func fetchAll(inProject projectID: TeamProject.ID, userCredential: UserCredential,
                  completion: @escaping (Result<List<Build>, AzureDevOpsError>) -> Void) {
        client.request(BuildEndpoint.list(projectID: projectID), userCredential: userCredential, completion: completion)
    }

    func fetch(build buildID: Build.ID, inProject projectID: TeamProject.ID, userCredential: UserCredential,
               completion: @escaping (Result<Build, AzureDevOpsError>) -> Void) {
        client.request(BuildEndpoint.get(buildID: buildID, projectID: projectID), userCredential: userCredential,
                       completion: completion)
    }

}
