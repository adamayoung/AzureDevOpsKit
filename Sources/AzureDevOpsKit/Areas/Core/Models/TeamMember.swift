import Foundation

public struct TeamMember: Identifiable {

    public var id: IdentityRef.ID {
        identity.id
    }

    public let isTeamAdmin: Bool
    public let identity: IdentityRef

}

extension TeamMember: Decodable { }
