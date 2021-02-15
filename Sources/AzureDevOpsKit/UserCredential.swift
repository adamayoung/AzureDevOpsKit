import Foundation

/// User Credential for authenticating against the Azure DevOps API.
public final class UserCredential {

    /// The Organisation name.
    public let organisationName: String
    /// Personal Access Token.
    public let pat: String?

    /// The current User Credential.
    public static var current: UserCredential?

    /// Creates a new User Credential.
    ///
    /// - Parameter organisationName: The Azure DevOps organisation name.
    /// - Parameter pat: A user's Personal Access Token.
    public init(organisationName: String, pat: String) {
        self.organisationName = organisationName
        self.pat = pat
    }

    var baseURL: URL {
        URL(string: "https://dev.azure.com/\(organisationName)")!
    }

}
