import Foundation

/// Log for a pipeline.
public struct PipelineLog: Identifiable, Decodable {

    /// The ID of the log.
    public let id: Int
    /// The number of lines in the log.
    public let lineCount: Int
    /// The date and time the log was created.
    public let createdAt: Date
    /// The date and time the log was last changed.
    public let updatedAt: Date

}

extension PipelineLog {

    private enum CodingKeys: String, CodingKey {
        case id
        case lineCount
        case createdAt = "createdOn"
        case updatedAt = "lastChangedOn"
    }

}
