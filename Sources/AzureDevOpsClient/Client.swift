import AzureDevOpsShared
import Foundation

public protocol Client {

    func request<Response: Decodable>(_ endpoint: Endpoint, userCredential: UserCredential,
                                   completion: @escaping (Result<Response, AzureDevOpsError>) -> Void)

}

public final class HTTPClient: Client {

    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder

    public init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .azureDevOps) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }

    public func request<Response: Decodable>(_ endpoint: Endpoint, userCredential: UserCredential,
                                             completion: @escaping (Result<Response, AzureDevOpsError>) -> Void) {
        let url = urlFromPath(endpoint.path, for: userCredential)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue(authorizationHeaderValue(for: userCredential), forHTTPHeaderField: "Authorization")

        urlSession.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let self = self else {
                return
            }

            if let error = error {
                let azureDevOpsError = AzureDevOpsError(message: error.localizedDescription)
                completion(.failure(azureDevOpsError))
                return
            }

            guard let data = data else {
                let azureDevOpsError = AzureDevOpsError(message: "No data received")
                completion(.failure(azureDevOpsError))
                return
            }

            do {
                let response = try self.jsonDecoder.decode(Response.self, from: data)
                completion(.success(response))
            } catch let error {
                let azureDevOpsError = AzureDevOpsError(message: error.localizedDescription)
                completion(.failure(azureDevOpsError))
                return
            }
        }.resume()
    }

}

extension HTTPClient {

    private func urlFromPath(_ path: URL, for userCredential: UserCredential) -> URL {
        guard var urlComponents = URLComponents(url: path, resolvingAgainstBaseURL: true) else {
            return path
        }

        let baseURL = userCredential.baseURL
        urlComponents.scheme = baseURL.scheme
        urlComponents.host = baseURL.host
        urlComponents.path = baseURL.path + "\(urlComponents.path)"
        urlComponents.query = path.query

        return urlComponents.url!
    }

    private func authorizationHeaderValue(for userCredential: UserCredential) -> String? {
        guard let pat = userCredential.pat else {
            return nil
        }

        let encodedPAT = "-n:\(pat)".data(using: .utf8)!.base64EncodedString()
        return "Basic \(encodedPAT)"
    }

}
