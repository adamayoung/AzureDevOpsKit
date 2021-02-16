import AzureDevOpsShared
import Foundation

/// Represents a queue for running builds.
public struct AgentPoolQueue: Identifiable, Decodable {

    /// The ID of the queue.
    public let id: Int
    /// The name of the queue.
    public let name: String
    /// The pool used by this queue.
    public let pool: TaskAgentPoolReference
    /// The class to represent a collection of REST reference links.
    public let links: ReferenceLinks

}

extension AgentPoolQueue {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case pool
        case links = "_links"
    }

}
