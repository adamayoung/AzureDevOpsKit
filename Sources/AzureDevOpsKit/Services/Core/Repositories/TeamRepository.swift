import Foundation

protocol TeamRepository {

    func fetchAll(parameters: FetchAllTeamsParameters?, completion: @escaping (Result<List<Team>, AzureDevOpsError>) -> Void)

    func fetchAll(inProject projectID: TeamProject.ID,
                  completion: @escaping (Result<List<Team>, AzureDevOpsError>) -> Void)

    func fetch(team teamID: Team.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Team, AzureDevOpsError>) -> Void)

    func fetchTeamMembers(inTeam teamID: Team.ID, inProject projectID: TeamProject.ID,
                          completion: @escaping (Result<List<TeamMember>, AzureDevOpsError>) -> Void)

}

final class TeamHTTPRepository: TeamRepository {

    private let client: Client

    init(client: Client = HTTPClient()) {
        self.client = client
    }

    func fetchAll(parameters: FetchAllTeamsParameters? = nil,
                  completion: @escaping (Result<List<Team>, AzureDevOpsError>) -> Void) {
        client.request(TeamEndpoint.listAll(parameters: parameters), completion: completion)
    }

    func fetchAll(inProject projectID: TeamProject.ID,
                  completion: @escaping (Result<List<Team>, AzureDevOpsError>) -> Void) {
        client.request(TeamEndpoint.list(projectID: projectID), completion: completion)
    }

    func fetch(team teamID: Team.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Team, AzureDevOpsError>) -> Void) {
        client.request(TeamEndpoint.get(teamID: teamID, projectID: projectID), completion: completion)
    }

    func fetchTeamMembers(inTeam teamID: Team.ID, inProject projectID: TeamProject.ID,
                          completion: @escaping (Result<List<TeamMember>, AzureDevOpsError>) -> Void) {
        client.request(TeamEndpoint.getTeamMembers(teamID: teamID, projectID: projectID), completion: completion)
    }

}
