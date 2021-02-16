import AzureDevOpsShared
import Foundation

public final class AzureDevOpsCoreService: CoreService {

    private let userCredential: UserCredential
    private let projectRepository: ProjectRepository
    private let teamRepository: TeamRepository

    init(userCredential: UserCredential, projectRepository: ProjectRepository, teamRepository: TeamRepository) {
        self.userCredential = userCredential
        self.projectRepository = projectRepository
        self.teamRepository = teamRepository
    }

    public convenience init(userCredential: UserCredential) {
        let projectRepository = ProjectHTTPRepository()
        let teamRepository = TeamHTTPRepository()

        self.init(userCredential: userCredential, projectRepository: projectRepository, teamRepository: teamRepository)
    }

    public func fetchAllProjects(parameters: FetchAllProjectsParameters? = nil,
                                 completion: @escaping (Result<[TeamProjectReference], AzureDevOpsError>) -> Void) {
        projectRepository.fetchAll(parameters: parameters, userCredential: userCredential) { result in
            completion(result.map(\.value))
        }
    }

    public func fetch(project projectID: TeamProject.ID, parameters: FetchProjectParameters? = nil,
                      completion: @escaping (Result<TeamProject, AzureDevOpsError>) -> Void) {
        projectRepository.fetch(project: projectID, parameters: parameters, userCredential: userCredential,
                                completion: completion)
    }

    public func fetchProperties(forProject projectID: TeamProject.ID,
                                parameters: FetchProjectPropertiesParameters? = nil,
                                completion: @escaping (Result<[ProjectProperty], AzureDevOpsError>) -> Void) {
        projectRepository.fetchProperties(forProject: projectID, parameters: parameters,
                                          userCredential: userCredential) { result in
            completion(result.map(\.value))
        }
    }

    public func fetchAllTeams(parameters: FetchAllTeamsParameters?,
                              completion: @escaping (Result<[Team], AzureDevOpsError>) -> Void) {
        teamRepository.fetchAll(parameters: parameters, userCredential: userCredential) { result in
            completion(result.map(\.value))
        }
    }

    public func fetchAllTeams(inProject projectID: TeamProject.ID,
                              completion: @escaping (Result<[Team], AzureDevOpsError>) -> Void) {
        teamRepository.fetchAll(inProject: projectID, userCredential: userCredential) { result in
            completion(result.map(\.value))
        }
    }

    public func fetch(team teamID: Team.ID, inProject projectID: TeamProject.ID,
                      completion: @escaping (Result<Team, AzureDevOpsError>) -> Void) {
        teamRepository.fetch(team: teamID, inProject: projectID, userCredential: userCredential, completion: completion)
    }

    public func fetchTeamMembers(inTeam teamID: Team.ID, inProject projectID: TeamProject.ID,
                                 completion: @escaping (Result<[TeamMember], AzureDevOpsError>) -> Void) {
        teamRepository.fetchTeamMembers(inTeam: teamID, inProject: projectID,
                                        userCredential: userCredential) { result in
            completion(result.map(\.value))
        }
    }

}
