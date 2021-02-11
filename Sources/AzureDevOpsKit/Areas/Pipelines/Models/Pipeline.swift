import Foundation

public struct Pipeline: Identifiable {

    public let id: Int
    public let name: String
    public let folder: String
    public let revision: Int
    public let configuration: Configuration?
    public let links: ReferenceLinks

}

extension Pipeline: Decodable {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case folder
        case revision
        case configuration
        case links = "_links"
    }

}

extension Pipeline {

    public struct Configuration {

        public let type: ConfigurationType
        public let path: String?
        public let repository: Repository?

    }

}

extension Pipeline.Configuration: Decodable { }

extension Pipeline.Configuration {

    public enum ConfigurationType: String {

        case designerHyphenJSON = "designerHyphenJson"
        case designerJSON = "designerJson"
        case justInTime
        case unknown
        case yaml

    }

    public struct Repository: Identifiable {

        public let id: UUID
        public let type: String

    }

}

extension Pipeline.Configuration.ConfigurationType: Decodable { }

extension Pipeline.Configuration.Repository: Decodable { }
