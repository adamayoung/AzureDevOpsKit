import Foundation

public struct Log: Identifiable {

    public let id: Int
    public let lineCount: Int
    public let createdAt: Date
    public let updatedAt: Date

}

extension Log: Decodable {

    private enum CodingKeys: String, CodingKey {
        case id
        case lineCount
        case createdAt = "createdOn"
        case updatedAt = "lastChangedOn"
    }

}
