import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

/// Azure DevOps Services Builds.
///
/// - Note: [Azure DevOps Services Build](https://docs.microsoft.com/en-us/rest/api/azure/devops/build/?view=azure-devops-rest-6.1)
public protocol BuildService {

    /// Get all projects in the organization that the authenticated user has access to.
    ///
    /// - Note: [Builds - List](https://docs.microsoft.com/en-us/rest/api/azure/devops/build/builds/list?view=azure-devops-rest-6.1)
    ///
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter completion: The completion handler.
    func fetchAllBuilds(inProject projectID: TeamProject.ID,
                        completion: @escaping (Result<[Build], AzureDevOpsError>) -> Void)

    /// Get project with the specified id or name, optionally including capabilities.
    ///
    /// - Note: [Projects - Get](https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/get?view=azure-devops-rest-6.1)
    ///
    /// - Parameter buildID: The Build identifier.
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter completion: The completion handler.
    func fetch(build buildID: Build.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Build, AzureDevOpsError>) -> Void)

}
