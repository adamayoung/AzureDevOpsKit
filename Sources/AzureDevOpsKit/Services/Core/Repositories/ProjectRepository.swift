import Foundation

protocol ProjectRepository {

    func fetchAll(parameters: FetchAllProjectsParameters?,
                  completion: @escaping (Result<List<TeamProjectReference>, AzureDevOpsError>) -> Void)

    func fetch(project projectID: TeamProject.ID, parameters: FetchProjectParameters?,
               completion: @escaping (Result<TeamProject, AzureDevOpsError>) -> Void)

    func fetchProperties(forProject projectID: TeamProject.ID, parameters: FetchProjectPropertiesParameters?,
                         completion: @escaping (Result<List<ProjectProperty>, AzureDevOpsError>) -> Void)

}

final class ProjectHTTPRepository: ProjectRepository {

    private let client: Client

    init(client: Client = HTTPClient()) {
        self.client = client
    }

    func fetchAll(parameters: FetchAllProjectsParameters? = nil,
                  completion: @escaping (Result<List<TeamProjectReference>, AzureDevOpsError>) -> Void) {
        client.request(ProjectEndpoint.list(parameters: parameters), completion: completion)
    }

    func fetch(project projectID: TeamProject.ID, parameters: FetchProjectParameters? = nil,
               completion: @escaping (Result<TeamProject, AzureDevOpsError>) -> Void) {
        client.request(ProjectEndpoint.get(projectID: projectID, parameters: parameters), completion: completion)
    }

    func fetchProperties(forProject projectID: TeamProject.ID, parameters: FetchProjectPropertiesParameters? = nil,
                         completion: @escaping (Result<List<ProjectProperty>, AzureDevOpsError>) -> Void) {
        client.request(ProjectEndpoint.properties(projectID: projectID, parameters: parameters), completion: completion)
    }

}
