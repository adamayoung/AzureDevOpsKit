import AzureDevOpsShared
import Foundation

/// A Run.
public struct Run: Identifiable, Decodable {

    /// Run ID.
    public let id: Int
    /// Run name.
    public let name: String
    /// Run state.
    public let state: State
    /// Run result.
    public let result: RunResult
    /// Reference to this Run's Pipeline.
    public let pipeline: PipelineReference
    /// Created date.
    public let createdAt: Date
    /// Finished date.
    public let finishedAt: Date?
    /// The class to represent a collection of REST reference links.
    public let links: ReferenceLinks

}

extension Run {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case state
        case result
        case pipeline
        case createdAt = "createdDate"
        case finishedAt = "finishedDate"
        case links = "_links"
    }

}

extension Run {

    /// Run State.
    public enum State: String, Decodable {
        /// In progress.
        case inProgress
        /// Completed.
        case completed
        /// Canceling.
        case canceling
        /// Unknown.
        case unknown
    }

    /// Run Result.
    public enum RunResult: String, Decodable {
        /// Succeeded.
        case succeeded
        /// Failed.
        case failed
        /// Canceled.
        case canceled
        /// Unknown.
        case unknown
    }

}
