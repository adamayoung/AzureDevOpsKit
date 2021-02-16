import AzureDevOpsClient
import AzureDevOpsShared
import Foundation

final class TeamHTTPRepository: TeamRepository {

    private let client: Client

    init(client: Client = HTTPClient()) {
        self.client = client
    }

    func fetchAll(parameters: FetchAllTeamsParameters? = nil, userCredential: UserCredential,
                  completion: @escaping (Result<List<Team>, AzureDevOpsError>) -> Void) {
        client.request(TeamEndpoint.listAll(parameters: parameters), userCredential: userCredential,
                       completion: completion)
    }

    func fetchAll(inProject projectID: TeamProject.ID, userCredential: UserCredential,
                  completion: @escaping (Result<List<Team>, AzureDevOpsError>) -> Void) {
        client.request(TeamEndpoint.list(projectID: projectID), userCredential: userCredential, completion: completion)
    }

    func fetch(team teamID: Team.ID, inProject projectID: TeamProject.ID, userCredential: UserCredential,
               completion: @escaping (Result<Team, AzureDevOpsError>) -> Void) {
        client.request(TeamEndpoint.get(teamID: teamID, projectID: projectID), userCredential: userCredential, completion: completion)
    }

    func fetchTeamMembers(inTeam teamID: Team.ID, inProject projectID: TeamProject.ID, userCredential: UserCredential,
                          completion: @escaping (Result<List<TeamMember>, AzureDevOpsError>) -> Void) {
        client.request(TeamEndpoint.getTeamMembers(teamID: teamID, projectID: projectID),
                       userCredential: userCredential, completion: completion)
    }

}
