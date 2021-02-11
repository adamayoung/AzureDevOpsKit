import Foundation

public struct Run: Identifiable {

    public let id: Int
    public let name: String
    public let state: State
    public let result: RunResult
    public let pipeline: PipelineReference
    public let createdAt: Date
    public let finishedAt: Date?
    public let links: ReferenceLinks

}

extension Run: Decodable {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case state
        case result
        case pipeline
        case createdAt = "createdDate"
        case finishedAt = "finishedDate"
        case links = "_links"
    }

}

extension Run {

    public enum State: String {

        case inProgress
        case completed
        case canceling
        case unknown

    }

    public enum RunResult: String {

        case succeeded
        case failed
        case canceled
        case unknown

    }

}

extension Run.State: Decodable { }

extension Run.RunResult: Decodable { }
