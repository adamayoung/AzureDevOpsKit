import Foundation

/// The Azure DevOps Service.
///
/// - Note: [Azure DevOps documentation](https://docs.microsoft.com/en-gb/azure/devops/?view=azure-devops)
public final class AzureDevOpsService {

    /// The shared instance of the `AzureDevOpsService`.
    public static let shared = AzureDevOpsService()

    /// Build service.
    public let build: BuildService
    /// Core service.
    public let core: CoreService
    /// Pipelines service.
    public let pipelines: PipelineService

    init(buildService: BuildService = BuildDefaultService(), coreService: CoreService = CoreDefaultService(),
         pipelineService: PipelineService = PipelineDefaultService()) {
        self.build = buildService
        self.core = coreService
        self.pipelines = pipelineService
    }

}
