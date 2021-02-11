import Foundation

public enum ProjectState: String {

    case all
    case createPending
    case deleted
    case deleting
    case new
    case unchanged
    case wellFormed

}

extension ProjectState: Decodable { }
