import Foundation

/// A reference to a Pipeline.
public struct PipelineReference: Identifiable, Decodable {

    /// Pipeline ID.
    public let id: Int
    /// Pipeline name.
    public let name: String
    /// Pipeline folder.
    public let folder: String
    /// Revision number.
    public let revision: Int

}

extension PipelineReference {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case folder
        case revision
    }

}
