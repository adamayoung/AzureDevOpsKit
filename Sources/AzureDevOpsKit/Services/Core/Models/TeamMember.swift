import Foundation

public struct TeamMember: Identifiable, Decodable {

    /// Alias to the team member's identity ID.
    public var id: IdentityReference.ID {
        identity.id
    }

    /// Identity reference for this team member.
    public let identity: IdentityReference
    /// Is team member an admin.
    public let isTeamAdmin: Bool

}
