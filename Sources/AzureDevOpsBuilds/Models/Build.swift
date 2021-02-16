import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

/// Data representation of a build.
public struct Build: Identifiable, Decodable {

    /// The ID of the build.
    public let id: Int
    /// The build number/name of the build.
    public let buildNumber: String
    /// The status of the build.
    public let status: Status
    /// The build result.
    public let result: BuildResult
    /// The date and time that the build was queued.
    public let queuedAt: Date
    /// The date and time that the build was started.
    public let startedAt: Date?
    /// The date time that the build was completed.
    public let finishedAt: Date?
    /// The definition associated with the build.
    public let definition: DefinitionReference
    /// The team project.
    public let project: TeamProjectReference
    /// The source branch.
    public let sourceBranch: String
    /// The source version.
    public let sourceVersion: String
    /// The queue. This is only set if the definition type is Build.
    public let queue: AgentPoolQueue?
    /// The build's priority.
    public let priority: QueuePriority
    /// The reason that the build was created.
    public let reason: Reason
    /// The identity on whose behalf the build was queued.
    public let requestedFor: IdentityReference
    /// The identity that queued the build.
    public let requestedBy: IdentityReference
    /// The date the build was last changed.
    public let lastChangedAt: Date
    /// The date the build was last changed.
    public let lastChangedBy: IdentityReference
    /// The orchestration plan for the build.
    public let orchestrationPlan: TaskOrchestrationPlanReference
    /// Orchestration plans associated with the build (build, cleanup).
    public let plans: [TaskOrchestrationPlanReference]
    /// The repository.
    public let repository: Repository
    /// Indicates whether the build should be skipped by retention policies.
    public let keepForever: Bool
    /// Indicates whether the build is retained by a release.
    public let retainedByRelease: Bool
    /// The build that triggered this build via a Build completion trigger.
    public let triggeredByBuild: Bool
    /// The class to represent a collection of REST reference links.
    public let links: ReferenceLinks

}

extension Build {

    private enum CodingKeys: String, CodingKey {
        case id
        case buildNumber
        case status
        case result
        case queuedAt = "queueTime"
        case startedAt = "startTime"
        case finishedAt = "finishTime"
        case definition
        case project
        case sourceBranch
        case sourceVersion
        case queue
        case priority
        case reason
        case requestedFor
        case requestedBy
        case lastChangedAt = "lastChangedDate"
        case lastChangedBy
        case orchestrationPlan
        case plans
        case repository
        case keepForever
        case retainedByRelease
        case triggeredByBuild
        case links = "_links"
    }

}

extension Build {

    /// A build status.
    public enum Status: String, Decodable {
        /// All status.
        case all
        /// The build is cancelling.
        case cancelling
        /// The build has completed.
        case completed
        /// The build is currently in progress.
        case inProgress
        /// No status.
        case none
        /// The build has not yet started.
        case notStarted
        /// The build is inactive in the queue.
        case postponed
    }

    /// A build result.
    public enum BuildResult: String, Decodable {
        /// The build was canceled before starting.
        case canceled
        /// The build completed unsuccessfully.
        case failed
        /// No result
        case none
        /// The build completed compilation successfully but had other errors.
        case partiallySucceeded
        /// The build completed successfully.
        case succeeded
    }

    /// The reason a build was created.
    public enum Reason: String, Decodable {
        /// All reasons.
        case all
        /// The build was started for the trigger TriggerType.BatchedContinuousIntegration.
        case batchedCI
        /// The build was started when another build completed.
        case buildCompletion
        /// The build was started for the trigger ContinuousIntegrationType.Gated.
        case checkInShelveset
        /// The build was started for the trigger TriggerType.ContinuousIntegration.
        case individualCI
        /// The build was started manually.
        case manual
        /// No reason. This value should not be used.
        case none
        /// The build was started by a pull request. Added in resource version 3.
        case pullRequest
        /// The build was started when resources in pipeline triggered it
        case resourceTrigger
        /// The build was started for the trigger TriggerType.Schedule.
        case schedule
        /// The build was started for the trigger TriggerType.ScheduleForced.
        case scheduleForced
        /// The build was triggered for retention policy purposes.
        case triggered
        /// The build was created by a user.
        case userCreated
        /// The build was started manually for private validation.
        case validateShelveset
    }

    /// Represents a repository used by a build definition.
    public struct Repository: Identifiable, Decodable {

        /// The ID of the repository.
        public let id: UUID
        /// The friendly name of the repository.
        public let name: String
        /// The type of the repository.
        public let type: String
        /// The URL of the repository.
        public let url: URL
        /// Indicates whether to clean the target folder when getting code from the repository.
        public let clean: String?
        /// Indicates whether to checkout submodules.
        public let checkoutSubmodules: Bool

    }

}
