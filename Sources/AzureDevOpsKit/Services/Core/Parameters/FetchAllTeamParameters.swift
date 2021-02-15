import Foundation

/// Fetch all teams parameters.
public struct FetchAllTeamsParameters {

    /// Number of teams to skip.
    public let skip: Int?
    /// Maximum number of teams to return.
    public let top: Int?
    /// A value indicating whether or not to expand Identity information in the result WebApiTeam object.
    public let expandIdentity: Bool?
    /// If true, then return all teams requesting user is member. Otherwise return all teams user has read access.
    public let mine: Bool?

    /// Constructs a new `FetchAllTeamsParameters`.
    ///
    /// - Parameter skip: Number of teams to skip.
    /// - Parameter top: Maximum number of teams to return.
    /// - Parameter expandIdentity: A value indicating whether or not to expand Identity information in the result WebApiTeam object.
    /// - Parameter mine: If true, then return all teams requesting user is member. Otherwise return all teams user has read access.
    public init(skip: Int? = nil, top: Int? = nil, expandIdentity: Bool? = nil, mine: Bool? = nil) {
        self.skip = skip
        self.top = top
        self.expandIdentity = expandIdentity
        self.mine = mine
    }

}

extension FetchAllTeamsParameters: Parameters {

    var queryItems: [URLQueryItem] {
        var items = [URLQueryItem]()
        if let skip = skip {
            items.append(URLQueryItem(name: "$skip", value: "\(skip)"))
        }

        if let top = top {
            items.append(URLQueryItem(name: "$top", value: "\(top)"))
        }

        if let expandIdentity = expandIdentity {
            items.append(URLQueryItem(name: "$expandIdentity", value: expandIdentity ? "true" : "false"))
        }

        if let mine = mine {
            items.append(URLQueryItem(name: "$mine", value: mine ? "true" : "false"))
        }

        return items
    }

}
