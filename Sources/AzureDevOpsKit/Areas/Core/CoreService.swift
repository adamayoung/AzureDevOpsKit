import Foundation

public protocol CoreService {

    /// Get all projects in the organization that the authenticated user has access to.
    ///
    /// - Note: [Projects - List](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/list?view=azure-devops-rest-6.1)
    ///
    /// - Parameter completion: The completion handler.
    func fetchAllProjects(completion: @escaping (Result<[TeamProjectReference], AzureDevOpsError>) -> Void)

    /// Get project with the specified id or name, optionally including capabilities.
    ///
    /// - Note: [Projects - Get](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/get?view=azure-devops-rest-6.1)
    ///
    /// - Parameter projectID: The team project ID.
    /// - Parameter completion: The completion handler.
    func fetch(project projectID: TeamProject.ID,
               completion: @escaping (Result<TeamProject, AzureDevOpsError>) -> Void)

    /// Get a collection of team project properties.
    ///
    /// - Note: [Projects - Get Project Properties](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/get%20project%20properties?view=azure-devops-rest-6.1)
    ///
    /// - Parameter projectID: The team project ID.
    /// - Parameter completion: The completion handler.
    func fetchProperties(forProject projectID: TeamProject.ID,
                         completion: @escaping (Result<[ProjectProperty], AzureDevOpsError>) -> Void)

    /// Get a list of all teams.
    ///
    /// - Note: [Teams - Get All Teams](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/teams/get%20all%20teams?view=azure-devops-rest-6.1)
    ///
    /// - Parameter completion: The completion handler.
    func fetchAllTeams(completion: @escaping (Result<[Team], AzureDevOpsError>) -> Void)

    /// Get a list of all teams.
    ///
    /// - Note: [Teams - Get Teams](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/teams/get%20teams?view=azure-devops-rest-6.1)
    ///
    /// - Parameter projectID: The team project ID.
    /// - Parameter completion: The completion handler.
    func fetchAllTeams(inProject projectID: TeamProject.ID,
                       completion: @escaping (Result<[Team], AzureDevOpsError>) -> Void)

    /// Get a specific team.
    ///
    /// - Note: [Teams - Get](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/teams/get?view=azure-devops-rest-6.1)
    ///
    /// - Parameter teamID: The team  ID.
    /// - Parameter projectID: The team project ID.
    /// - Parameter completion: The completion handler.
    func fetch(team teamID: Team.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Team, AzureDevOpsError>) -> Void)

    /// Get a list of members for a specific team.
    ///
    /// - Note: [Teams - Get Team Members](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/teams/get%20team%20members%20with%20extended%20properties?view=azure-devops-rest-6.1)
    ///
    /// - Parameter teamID: The team  ID.
    /// - Parameter projectID: The team project ID.
    /// - Parameter completion: The completion handler.
    func fetchTeamMembers(inTeam teamID: Team.ID, inProject projectID: TeamProject.ID,
                          completion: @escaping (Result<[TeamMember], AzureDevOpsError>) -> Void)

}
