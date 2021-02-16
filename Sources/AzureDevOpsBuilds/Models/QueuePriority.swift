import Foundation

/// A build's priority.
public enum QueuePriority: String, Decodable {
    /// Low priority.
    case low
    /// Below normal priority.
    case belowNormal
    /// Normal priority.
    case normal
    /// Above normal priority.
    case aboveNormal
    /// High priority.
    case high
}
