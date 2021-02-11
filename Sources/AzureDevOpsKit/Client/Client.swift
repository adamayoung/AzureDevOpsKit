import Foundation

protocol Client {

    func setPAT(_ pat: String?)

    func send<Response: Decodable>(_ endpoint: Endpoint,
                                   completion: @escaping (Result<Response, AzureDevOpsError>) -> Void)

}

class HTTPClient: Client {

    private let baseURL: URL
    private let organisationName: String
    private let urlSession: URLSession

    private var pat: String?

    init(organisationName: String, urlSession: URLSession = .shared) {
        self.organisationName = organisationName
        self.urlSession = urlSession
        self.baseURL = URL(string: "https://dev.azure.com/\(organisationName)/_apis")!

    }

    func setPAT(_ pat: String?) {
        self.pat = pat
    }

    func send<Response: Decodable>(_ endpoint: Endpoint,
                                   completion: @escaping (Result<Response, AzureDevOpsError>) -> Void) {
        let url = urlFromPath(endpoint.path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        let encodedPAT = "-n:\(pat ?? "")".data(using: .utf8)!.base64EncodedString()

        urlRequest.setValue("Basic \(encodedPAT)", forHTTPHeaderField: "Authorization")

        urlSession.dataTask(with: urlRequest) { data, response, error in
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
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(AzureDevOpsDateFormatter())
                let response = try decoder.decode(Response.self, from: data)

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

    private func urlFromPath(_ path: URL) -> URL {
        guard var urlComponents = URLComponents(url: path, resolvingAgainstBaseURL: true) else {
            return path
        }

        urlComponents.scheme = baseURL.scheme
        urlComponents.host = baseURL.host
        urlComponents.path = baseURL.path + "\(urlComponents.path)"
        urlComponents.query = path.query

        return urlComponents.url!
    }

}
