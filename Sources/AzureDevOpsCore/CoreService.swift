import AzureDevOpsShared
import Foundation

/// An Azure DevOps Services organization has one or more team projects. Each team project has one or more teams that contribute to that project.
///
/// - Note: [Projects and Teams REST API for Azure DevOps Services](https://docs.microsoft.com/en-us/rest/api/azure/devops/core)
public protocol CoreService {

    /// Get all projects in the organization that the authenticated user has access to.
    ///
    /// - Note: [Projects - List](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/list)
    ///
    /// - Parameter parameters: Fetch parameters.
    /// - Parameter completion: The completion handler.
    func fetchAllProjects(parameters: FetchAllProjectsParameters?,
                          completion: @escaping (Result<[TeamProjectReference], AzureDevOpsError>) -> Void)

    /// Get project with the specified id or name, optionally including capabilities.
    ///
    /// - Note: [Projects - Get](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/get?view=azure-devops-rest-6.1)
    ///
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter parameters: Fetch parameters.
    /// - Parameter completion: The completion handler.
    func fetch(project projectID: TeamProject.ID, parameters: FetchProjectParameters?,
               completion: @escaping (Result<TeamProject, AzureDevOpsError>) -> Void)

    /// Get a collection of team project properties.
    ///
    /// - Note: [Projects - Get Project Properties](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/get%20project%20properties)
    ///
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter parameters: Fetch parameters.
    /// - Parameter completion: The completion handler.
    func fetchProperties(forProject projectID: TeamProject.ID, parameters: FetchProjectPropertiesParameters?,
                         completion: @escaping (Result<[ProjectProperty], AzureDevOpsError>) -> Void)

    /// Get a list of all teams.
    ///
    /// - Note: [Teams - Get All Teams](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/teams/get%20all%20teams)
    ///
    /// - Parameter parameters: Fetch parameters.
    /// - Parameter completion: The completion handler.
    func fetchAllTeams(parameters: FetchAllTeamsParameters?,
                       completion: @escaping (Result<[Team], AzureDevOpsError>) -> Void)

    /// Get a list of all teams.
    ///
    /// - Note: [Teams - Get Teams](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/teams/get%20teams)
    ///
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter completion: The completion handler.
    func fetchAllTeams(inProject projectID: TeamProject.ID,
                       completion: @escaping (Result<[Team], AzureDevOpsError>) -> Void)

    /// Get a specific team.
    ///
    /// - Note: [Teams - Get](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/teams/get)
    ///
    /// - Parameter teamID: The Team identifier.
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter completion: The completion handler.
    func fetch(team teamID: Team.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Team, AzureDevOpsError>) -> Void)

    /// Get a list of members for a specific team.
    ///
    /// - Note: [Teams - Get Team Members](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/teams/get%20team%20members%20with%20extended%20properties)
    ///
    /// - Parameter teamID: The team  identifier.
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter completion: The completion handler.
    func fetchTeamMembers(inTeam teamID: Team.ID, inProject projectID: TeamProject.ID,
                          completion: @escaping (Result<[TeamMember], AzureDevOpsError>) -> Void)

}

extension CoreService {

    /// Get all projects in the organization that the authenticated user has access to.
    ///
    /// - Note: [Projects - List](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/list)
    ///
    /// - Parameter completion: The completion handler.
    func fetchAllProjects(completion: @escaping (Result<[TeamProjectReference], AzureDevOpsError>) -> Void) {
        fetchAllProjects(parameters: nil, completion: completion)
    }

    /// Get project with the specified id or name, optionally including capabilities.
    ///
    /// - Note: [Projects - Get](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/get)
    ///
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter completion: The completion handler.
    func fetch(project projectID: TeamProject.ID,
               completion: @escaping (Result<TeamProject, AzureDevOpsError>) -> Void) {
        fetch(project: projectID, parameters: nil, completion: completion)
    }

    /// Get a collection of team project properties.
    ///
    /// - Note: [Projects - Get Project Properties](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/get%20project%20properties)
    ///
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter completion: The completion handler.
    func fetchProperties(forProject projectID: TeamProject.ID,
                         completion: @escaping (Result<[ProjectProperty], AzureDevOpsError>) -> Void) {
        fetchProperties(forProject: projectID, parameters: nil, completion: completion)
    }

}
