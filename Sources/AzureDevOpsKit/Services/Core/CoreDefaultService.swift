import Foundation

final class CoreDefaultService: CoreService {

    private let projectRepository: ProjectRepository
    private let teamRepository: TeamRepository

    init(projectRepository: ProjectRepository = ProjectHTTPRepository(),
         teamRepository: TeamRepository = TeamHTTPRepository()) {
        self.projectRepository = projectRepository
        self.teamRepository = teamRepository
    }

    func fetchAllProjects(parameters: FetchAllProjectsParameters? = nil,
                          completion: @escaping (Result<[TeamProjectReference], AzureDevOpsError>) -> Void) {
        projectRepository.fetchAll(parameters: parameters) { result in
            completion(result.map(\.value))
        }
    }

    func fetch(project projectID: TeamProject.ID, parameters: FetchProjectParameters? = nil,
               completion: @escaping (Result<TeamProject, AzureDevOpsError>) -> Void) {
        projectRepository.fetch(project: projectID, parameters: parameters, completion: completion)
    }

    func fetchProperties(forProject projectID: TeamProject.ID, parameters: FetchProjectPropertiesParameters? = nil,
                         completion: @escaping (Result<[ProjectProperty], AzureDevOpsError>) -> Void) {
        projectRepository.fetchProperties(forProject: projectID, parameters: parameters) { result in
            completion(result.map(\.value))
        }
    }

    func fetchAllTeams(parameters: FetchAllTeamsParameters?,
                       completion: @escaping (Result<[Team], AzureDevOpsError>) -> Void) {
        teamRepository.fetchAll(parameters: parameters) { result in
            completion(result.map(\.value))
        }
    }

    func fetchAllTeams(inProject projectID: TeamProject.ID,
                       completion: @escaping (Result<[Team], AzureDevOpsError>) -> Void) {
        teamRepository.fetchAll(inProject: projectID) { result in
            completion(result.map(\.value))
        }
    }

    func fetch(team teamID: Team.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Team, AzureDevOpsError>) -> Void) {
        teamRepository.fetch(team: teamID, inProject: projectID, completion: completion)
    }

    func fetchTeamMembers(inTeam teamID: Team.ID, inProject projectID: TeamProject.ID,
                          completion: @escaping (Result<[TeamMember], AzureDevOpsError>) -> Void) {
        teamRepository.fetchTeamMembers(inTeam: teamID, inProject: projectID) { result in
            completion(result.map(\.value))
        }
    }

}
