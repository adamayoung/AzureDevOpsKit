import AzureDevOpsClient
import Foundation

/// Fetch all projects parameters.
public struct FetchAllProjectsParameters {

    /// Number of projects to skip.
    public let skip: Int?
    /// Maximum number of projects to return.
    public let top: Int?
    /// Continuation token.
    public let continuationToken: String?
    /// Fetch the default team image URL.
    public let getDefaultTeamImageURL: Bool?
    /// Filter on team projects in a specific team project state (default: WellFormed).
    public let stateFilter: ProjectState?

    /// Constructs a new `FetchAllProjectsParameters`.
    ///
    /// - Parameter skip: Number of projects to skip.
    /// - Parameter top: Maximum number of projects to return.
    /// - Parameter continuationToken: Continuation token.
    /// - Parameter getDefaultTeamImageURL: Include the default team image URL.
    /// - Parameter stateFilter: Filter on team projects in a specific team project state (default: WellFormed).
    public init(skip: Int? = nil, top: Int? = nil, continuationToken: String? = nil,
                getDefaultTeamImageURL: Bool? = nil, stateFilter: ProjectState? = nil) {
        self.skip = skip
        self.top = top
        self.continuationToken = continuationToken
        self.getDefaultTeamImageURL = getDefaultTeamImageURL
        self.stateFilter = stateFilter
    }

}

extension FetchAllProjectsParameters: Parameters {

    public var queryItems: [URLQueryItem] {
        var items = [URLQueryItem]()
        if let skip = skip {
            items.append(URLQueryItem(name: "$skip", value: "\(skip)"))
        }

        if let top = top {
            items.append(URLQueryItem(name: "$top", value: "\(top)"))
        }

        if let continuationToken = continuationToken {
            items.append(URLQueryItem(name: "continuationToken", value: continuationToken))
        }

        if let getDefaultTeamImageURL = getDefaultTeamImageURL {
            items.append(URLQueryItem(name: "getDefaultTeamImageUrl", value: getDefaultTeamImageURL ? "true" : "false"))
        }

        if let stateFilter = stateFilter {
            items.append(URLQueryItem(name: "stateFilter", value: stateFilter.rawValue))
        }

        return items
    }

}
