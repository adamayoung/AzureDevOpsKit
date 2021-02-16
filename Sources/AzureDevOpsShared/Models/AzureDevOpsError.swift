import Foundation

/// An Azure DevOps Error.
public struct AzureDevOpsError: LocalizedError, Decodable {

    private let message: String

    public init(message: String) {
        self.message = message
    }

    public var errorDescription: String? {
        message
    }

}
