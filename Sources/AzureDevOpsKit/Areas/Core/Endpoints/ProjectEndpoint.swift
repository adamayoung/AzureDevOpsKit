import Foundation

enum ProjectEndpoint {

    case list
    case get(projectID: TeamProject.ID)
    case properties(projectID: TeamProject.ID)

}

extension ProjectEndpoint: Endpoint {

    var path: URL {
        switch self {
        case .list:
            return URL(string: "/projects?api-version=6.1-preview.4")!

        case .get(let projectID):
            return URL(string: "/projects/\(projectID.uuidString.lowercased())?api-version=6.1-preview.4")!

        case .properties(let projectID):
            return URL(string: "/projects/\(projectID.uuidString.lowercased())/properties?api-version=6.1-preview.1")!
        }
    }

    var method: HTTPMethod {
        switch self {
        case .list:
            return .get

        case .get:
            return .get

        case .properties:
            return .get
        }
    }

}
