import Foundation

public typealias TokenHandler = ((Result<String, Error>) -> Void) -> Void

/// User Credential for authenticating against the Azure DevOps API.
public final class UserCredential {

    /// The Organisation name.
    public let organisationName: String
    public let tokenHandler: TokenHandler?
    /// Personal Access Token.
    public let pat: String?

    /// The current User Credential.
    public static var current: UserCredential?

    /// Creates a new User Credential.
    ///
    /// - Parameter organisationName: The Azure DevOps organisation name.
    /// - Parameter pat: A user's Personal Access Token.
    public convenience init(organisationName: String, pat: String) {
        self.init(organisationName: organisationName, pat: pat, tokenHandler: nil)
    }

    /// Creates a new User Credential.
    ///
    /// - Parameter organisationName: The Azure DevOps organisation name.
    /// - Parameter tokenHandler: Closure to return a new token
    public convenience init(organisationName: String, tokenHandler: @escaping TokenHandler) {
        self.init(organisationName: organisationName, pat: nil, tokenHandler: tokenHandler)
    }

    init(organisationName: String, pat: String?, tokenHandler: TokenHandler?) {
        self.organisationName = organisationName
        self.pat = pat
        self.tokenHandler = tokenHandler
    }

    public var baseURL: URL {
        URL(string: "https://dev.azure.com/\(organisationName)")!
    }

}
