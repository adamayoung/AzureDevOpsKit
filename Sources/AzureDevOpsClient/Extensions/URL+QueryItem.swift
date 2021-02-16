import Foundation

public extension URL {

    func appendingQueryItem(name: String, value: CustomStringConvertible) -> Self {
        let queryItem = URLQueryItem(name: name, value: value.description)
        return appendingQueryItems([queryItem])
    }

    func appendingQueryItems(_ queryItems: [URLQueryItem]) -> Self {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)!
        var items = urlComponents.queryItems ?? []
        items.append(contentsOf: queryItems)
        urlComponents.queryItems = items
        return urlComponents.url!
    }

    func appendingParameters(_ parameters: Parameters? = nil) -> Self {
        guard let parameters = parameters else {
            return self
        }

        return appendingQueryItems(parameters.queryItems)
    }

    func appendingAPIVersion(major: Int, minor: Int = 0, preview: Int? = nil) -> Self {
        let value: String = {
            let version = "\(major).\(minor)"

            guard let preview = preview else {
                return version
            }

            return "\(version)-preview.\(preview)"
        }()

        return appendingQueryItem(name: "api-version", value: value)
    }

}
