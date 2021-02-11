import Foundation

final class CoreHTTPService: CoreService {

    private let client: Client

    init(client: Client) {
        self.client = client
    }

    func fetchAllProjects(completion: @escaping (Result<[TeamProjectReference], AzureDevOpsError>) -> Void) {
        let endpoint = ProjectEndpoint.list
        client.send(endpoint) { (result: Result<List<TeamProjectReference>, AzureDevOpsError>) in
            switch result {
            case .success(let teamProjectList):
                completion(.success(teamProjectList.value))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetch(project projectID: TeamProject.ID,
               completion: @escaping (Result<TeamProject, AzureDevOpsError>) -> Void) {
        let endpoint = ProjectEndpoint.get(projectID: projectID)
        client.send(endpoint, completion: completion)
    }

    func fetchProperties(forProject projectID: TeamProject.ID,
                         completion: @escaping (Result<[ProjectProperty], AzureDevOpsError>) -> Void) {
        let endpoint = ProjectEndpoint.properties(projectID: projectID)
        client.send(endpoint) { (result: Result<List<ProjectProperty>, AzureDevOpsError>) in
            switch result {
            case .success(let projectPropertiesList):
                completion(.success(projectPropertiesList.value))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchAllTeams(completion: @escaping (Result<[Team], AzureDevOpsError>) -> Void) {
        let endpoint = TeamEndpoint.listAll
        client.send(endpoint) { (result: Result<List<Team>, AzureDevOpsError>) in
            switch result {
            case .success(let teamList):
                completion(.success(teamList.value))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchAllTeams(inProject projectID: TeamProject.ID,
                       completion: @escaping (Result<[Team], AzureDevOpsError>) -> Void) {
        let endpoint = TeamEndpoint.list(projectID: projectID)
        client.send(endpoint) { (result: Result<List<Team>, AzureDevOpsError>) in
            switch result {
            case .success(let teamList):
                completion(.success(teamList.value))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetch(team teamID: Team.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Team, AzureDevOpsError>) -> Void) {
        let endpoint = TeamEndpoint.get(teamID: teamID, projectID: projectID)
        client.send(endpoint, completion: completion)
    }

    func fetchTeamMembers(inTeam teamID: Team.ID, inProject projectID: TeamProject.ID,
                          completion: @escaping (Result<[TeamMember], AzureDevOpsError>) -> Void) {
        let endpoint = TeamEndpoint.getTeamMembers(teamID: teamID, projectID: projectID)
        client.send(endpoint) { (result: Result<List<TeamMember>, AzureDevOpsError>) in
            switch result {
            case .success(let teamMemberList):
                completion(.success(teamMemberList.value))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
