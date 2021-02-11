import Foundation

public struct IdentityRef: Identifiable {

    public let id: UUID
    public let uniqueName: String
    public let displayName: String
    public let imageURL: URL?
    public let descriptor: String
    public let links: ReferenceLinks

}

extension IdentityRef: Decodable {

    private enum CodingKeys: String, CodingKey {
        case id
        case uniqueName
        case displayName
        case imageURL = "imageUrl"
        case descriptor
        case links = "_links"
    }

}
