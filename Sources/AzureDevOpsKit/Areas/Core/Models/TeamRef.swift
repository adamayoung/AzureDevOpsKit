import Foundation

public struct TeamRef: Identifiable {

    public let id: UUID
    public let name: String

}

extension TeamRef: Decodable { }
