import Foundation

public struct AzureDevOpsError: LocalizedError, Decodable {

    public let message: String

    init(message: String) {
        self.message = message
    }

    public var errorDescription: String? {
        message
    }

}
