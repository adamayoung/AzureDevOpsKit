import Foundation

/// Definition of a pipeline.
public struct Pipeline: Identifiable, Decodable {

    /// Pipeline ID.
    public let id: Int
    /// Pipeline name.
    public let name: String
    /// Pipeline folder.
    public let folder: String
    /// Revision number.
    public let revision: Int
    /// Pipeline configuration.
    public let configuration: Configuration?
    /// The class to represent a collection of REST reference links.
    public let links: ReferenceLinks

}

extension Pipeline {

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

    /// Pipeline configuration.
    public struct Configuration: Decodable {

        /// Pipeline configuration type.
        public let type: ConfigurationType
        /// Path to configuration.
        public let path: String?
        /// Repository for this configuration.
        public let repository: Repository?

    }

}

extension Pipeline.Configuration {

    /// Type of configuration.
    public enum ConfigurationType: String, Decodable {
        /// Designer-JSON.
        case designerHyphenJSON = "designerHyphenJson"
        /// Designer JSON.
        case designerJSON = "designerJson"
        /// Just-in-time.
        case justInTime
        /// Unknown type.
        case unknown
        /// YAML.
        case yaml
    }

    /// A Pipeline's Configuration Repository.
    public struct Repository: Identifiable, Decodable {

        /// Repository ID.
        public let id: UUID
        /// Repository type.
        public let type: String

    }

}
