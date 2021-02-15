import Foundation

extension JSONDecoder {

    static var azureDevOps: JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(.azureDevOps)
        return jsonDecoder
    }

}
