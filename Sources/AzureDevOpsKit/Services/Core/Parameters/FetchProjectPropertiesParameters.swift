import Foundation

/// Fetch project properties parameters.
public struct FetchProjectPropertiesParameters {

    /// A comma-delimited string of team project property names. Wildcard characters ("?" and "*") are supported. If no key is specified, all properties will be returned.
    public let keys: [String]?

    /// Constructor for `FetchProjectPropertiesParameters`.
    ///
    /// - Parameter keys: A comma-delimited string of team project property names. Wildcard characters ("?" and "*") are supported. If no key is specified, all properties will be returned.
    public init(keys: String...) {
        self.keys = keys.isEmpty ? nil : keys
    }

}

extension FetchProjectPropertiesParameters: Parameters {

    var queryItems: [URLQueryItem] {
        var items = [URLQueryItem]()

        if let keys = keys, !keys.isEmpty {
            let value = keys.joined(separator: ",")
            items.append(URLQueryItem(name: "keys", value: value))
        }

        return items
    }

}
