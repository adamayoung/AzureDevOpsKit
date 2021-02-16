import AzureDevOpsClient
import Foundation

/// Fetch project parameters.
public struct FetchProjectParameters {

    /// Include capabilities (such as source control) in the team project result (default: false).
    public let includeCapabilities: Bool?
    /// Search within renamed projects (that had such name in the past).
    public let includeHistory: Bool?

    /// Constructs a new `FetchProjectParameters`.
    ///
    /// - Parameter includeCapabilities: Include capabilities (such as source control) in the team project result (default: false).
    /// - Parameter includeHistory: Search within renamed projects (that had such name in the past).
    public init(includeCapabilities: Bool? = nil, includeHistory: Bool? = nil) {
        self.includeCapabilities = includeCapabilities
        self.includeHistory = includeHistory
    }

}

extension FetchProjectParameters: Parameters {

    public var queryItems: [URLQueryItem] {
        var items = [URLQueryItem]()

        if let includeCapabilities = includeCapabilities {
            items.append(URLQueryItem(name: "includeCapabilities", value: includeCapabilities ? "true" : "false"))
        }

        if let includeHistory = includeHistory {
            items.append(URLQueryItem(name: "includeHistory", value: includeHistory ? "true" : "false"))
        }

        return items
    }

}
