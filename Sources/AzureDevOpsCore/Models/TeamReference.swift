import Foundation

/// A shallow reference to a Team.
public struct TeamReference: Identifiable, Decodable {

    /// Team (Identity) Guid. A Team Foundation ID.
    public let id: UUID
    /// Team name.
    public let name: String

}
