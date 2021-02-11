import Foundation

public struct PipelineReference: Identifiable {

    public let id: Int
    public let name: String
    public let folder: String
    public let revision: Int
    public let links: ReferenceLinks

}

extension PipelineReference: Decodable {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case folder
        case revision
        case links = "_links"
    }

}
