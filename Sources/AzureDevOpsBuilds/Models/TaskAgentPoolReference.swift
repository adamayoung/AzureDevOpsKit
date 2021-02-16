import Foundation

/// Represents a reference to an agent pool.
public struct TaskAgentPoolReference: Identifiable, Decodable {

    /// The pool ID.
    public let id: Int
    /// The pool name.
    public let name: String
    /// A value indicating whether or not this pool is managed by the service.
    public let isHosted: Bool

}
