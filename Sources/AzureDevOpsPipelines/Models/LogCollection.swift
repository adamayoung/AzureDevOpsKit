import Foundation

/// A collection of logs.
public struct LogCollection: Decodable {

    /// The list of logs.
    public let logs: [PipelineLog]

}
