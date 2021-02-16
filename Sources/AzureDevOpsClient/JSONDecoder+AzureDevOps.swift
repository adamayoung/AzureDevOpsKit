import Foundation

extension JSONDecoder {

    public static var azureDevOps: JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(.azureDevOps)
        return jsonDecoder
    }

}
