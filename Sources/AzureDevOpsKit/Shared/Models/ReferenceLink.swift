import Foundation

public struct ReferenceLink: Decodable {

    /// Link to this reference.
    public let href: URL

}

extension ReferenceLink {

    private enum CodingKeys: String, CodingKey {
        case href
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let hrefString = try container.decode(String.self, forKey: .href)
        guard
            let percentEncoded = hrefString
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let href = URL(string: percentEncoded)
        else {
            throw DecodingError.dataCorruptedError(forKey: .href, in: container,
                                                   debugDescription: "Invalid url string: \(hrefString)")
        }

        self.href = href
    }

}
