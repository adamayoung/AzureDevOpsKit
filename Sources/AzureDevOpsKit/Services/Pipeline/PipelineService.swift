import Foundation

/// Azure DevOps Services Pipelines.
///
/// - Note: [Azure DevOps Services Pipelines](https://docs.microsoft.com/en-us/rest/api/azure/devops/pipelines/?view=azure-devops-rest-6.1)
public protocol PipelineService {

    /// Get a list of pipelines.
    ///
    /// - Note: [Pipelines - List](https://docs.microsoft.com/en-us/rest/api/azure/devops/pipelines/pipelines/list?view=azure-devops-rest-6.1)
    ///
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter completion: The completion handler.
    func fetchAllPipelines(inProject projectID: TeamProject.ID,
                           completion: @escaping (Result<[Pipeline], AzureDevOpsError>) -> Void)

    /// Get a list of pipelines.
    ///
    /// - Note: [Pipelines - Get](https://docs.microsoft.com/en-us/rest/api/azure/devops/pipelines/pipelines/get?view=azure-devops-rest-6.1)
    ///
    /// - Parameter pipelineID: The Pipeline identifier.
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter completion: The completion handler.
    func fetch(pipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Pipeline, AzureDevOpsError>) -> Void)

    /// Gets top 10000 runs for a particular pipeline.
    ///
    /// - Note: [Runs - List](https://docs.microsoft.com/en-us/rest/api/azure/devops/pipelines/runs/list?view=azure-devops-rest-6.1)
    ///
    /// - Parameter pipelineID: The Pipeline identifier.
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter completion: The completion handler.
    func fetchAllRuns(forPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                      completion: @escaping (Result<[Run], AzureDevOpsError>) -> Void)

    /// Gets top 10000 runs for a particular pipeline.
    ///
    /// - Note: [Runs - Get](https://docs.microsoft.com/en-us/rest/api/azure/devops/pipelines/runs/get?view=azure-devops-rest-6.1)
    ///
    /// - Parameter runID: The Run identifier.
    /// - Parameter pipelineID: The Pipeline Identifier.
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter completion: The completion handler.
    func fetch(run runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
               completion: @escaping (Result<Run, AzureDevOpsError>) -> Void)

    /// Get a list of logs from a pipeline run.
    ///
    /// - Note: [Logs - List](https://docs.microsoft.com/en-us/rest/api/azure/devops/pipelines/logs/list?view=azure-devops-rest-6.1)
    ///
    /// - Parameter runID: The Run identifier.
    /// - Parameter pipelineID: The Pipeline identifier.
    /// - Parameter projectID: The Project identifier.
    /// - Parameter completion: The completion handler.
    func fetchLogs(forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID, inProject projectID: TeamProject.ID,
                   completion: @escaping (Result<[PipelineLog], AzureDevOpsError>) -> Void)

    /// Get a specific log from a pipeline run.
    ///
    /// - Note: [Logs - Get](https://docs.microsoft.com/en-us/rest/api/azure/devops/pipelines/logs/get?view=azure-devops-rest-6.1)
    ///
    /// - Parameter logID: The Log identifier.
    /// - Parameter runID: The Run identifier.
    /// - Parameter pipelineID: The Pipeline identifier.
    /// - Parameter projectID: The Team Project identifier.
    /// - Parameter completion: The completion handler.
    func fetch(log logID: PipelineLog.ID, forRun runID: Run.ID, inPipeline pipelineID: Pipeline.ID,
               inProject projectID: TeamProject.ID, completion: @escaping (Result<PipelineLog, AzureDevOpsError>) -> Void)

}
