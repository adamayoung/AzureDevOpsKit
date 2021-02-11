import Foundation

public final class AzureDevOpsService {

    public let core: CoreService
    public let pipelines: PipelineService

    private let organisationName: String
    private let client: Client

    private var pat: String? {
        didSet {
            client.setPAT(pat)
        }
    }

    public init(organisationName: String, pat: String? = nil) {
        self.organisationName = organisationName
        self.client = HTTPClient(organisationName: organisationName)
        self.client.setPAT(pat)
        self.pat = pat

        self.core = CoreHTTPService(client: client)
        self.pipelines = PipelineHTTPService(client: client)
    }

    public func setPAT(_ pat: String) {
        self.pat = pat
    }

}
