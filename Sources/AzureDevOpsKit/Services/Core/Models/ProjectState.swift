import Foundation

/// The state of a project.
public enum ProjectState: String, Decodable {
    /// All projects regardless of state.
    case all
    /// Project has been queued for creation, but the process has not yet started.
    case createPending
    /// Project has been deleted.
    case deleted
    /// Project is in the process of being deleted.
    case deleting
    /// Project is in the process of being created.
    case new
    /// Project has not been changed.
    case unchanged
    /// Project is completely created and ready to use.
    case wellFormed
}
