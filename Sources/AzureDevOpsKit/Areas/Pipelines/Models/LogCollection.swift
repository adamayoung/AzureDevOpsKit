import Foundation

public struct LogCollection {

    public let logs: [Log]

}

extension LogCollection: Decodable { }
