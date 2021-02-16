import AzureDevOpsShared
import Foundation

/// A shallow reference to an Identity.
public struct IdentityReference: Identifiable, Decodable {

    /// Identity ID.
    public let id: UUID
    /// This is the non-unique display name of the graph subject. To change this field, you must alter its value in the source provider.
    public let displayName: String
    /// The descriptor is the primary way to reference the graph subject while the system is running. This field will uniquely identify the same graph subject across both Accounts and Organizations.
    public let descriptor: String
    /// This field contains zero or more interesting links about the graph subject. These links may be invoked to obtain additional relationships or more detailed information about this graph subject.
    public let links: ReferenceLinks

}

extension IdentityReference {

    private enum CodingKeys: String, CodingKey {
        case id
        case displayName
        case descriptor
        case links = "_links"
    }

}
