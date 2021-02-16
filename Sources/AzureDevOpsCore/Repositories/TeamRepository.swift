import AzureDevOpsShared
import Foundation

protocol TeamRepository {

    func fetchAll(parameters: FetchAllTeamsParameters?, userCredential: UserCredential,
                  completion: @escaping (Result<List<Team>, AzureDevOpsError>) -> Void)

    func fetchAll(inProject projectID: TeamProject.ID, userCredential: UserCredential,
                  completion: @escaping (Result<List<Team>, AzureDevOpsError>) -> Void)

    func fetch(team teamID: Team.ID, inProject projectID: TeamProject.ID, userCredential: UserCredential,
               completion: @escaping (Result<Team, AzureDevOpsError>) -> Void)

    func fetchTeamMembers(inTeam teamID: Team.ID, inProject projectID: TeamProject.ID, userCredential: UserCredential,
                          completion: @escaping (Result<List<TeamMember>, AzureDevOpsError>) -> Void)

}
