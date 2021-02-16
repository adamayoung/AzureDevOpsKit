import AzureDevOpsClient
import AzureDevOpsShared
import Foundation

final class ProjectHTTPRepository: ProjectRepository {

    private let client: Client

    init(client: Client = HTTPClient()) {
        self.client = client
    }

    func fetchAll(parameters: FetchAllProjectsParameters? = nil, userCredential: UserCredential,
                  completion: @escaping (Result<List<TeamProjectReference>, AzureDevOpsError>) -> Void) {
        client.request(ProjectEndpoint.list(parameters: parameters), userCredential: userCredential,
                       completion: completion)
    }

    func fetch(project projectID: TeamProject.ID, parameters: FetchProjectParameters? = nil, userCredential: UserCredential,
               completion: @escaping (Result<TeamProject, AzureDevOpsError>) -> Void) {
        client.request(ProjectEndpoint.get(projectID: projectID, parameters: parameters),
                       userCredential: userCredential, completion: completion)
    }

    func fetchProperties(forProject projectID: TeamProject.ID, parameters: FetchProjectPropertiesParameters? = nil,
                         userCredential: UserCredential,
                         completion: @escaping (Result<List<ProjectProperty>, AzureDevOpsError>) -> Void) {
        client.request(ProjectEndpoint.properties(projectID: projectID, parameters: parameters),
                       userCredential: userCredential, completion: completion)
    }

}
