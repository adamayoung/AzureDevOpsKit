import Foundation

public enum ProjectVisibility: String {

    case `private`
    case `public`

}

extension ProjectVisibility: Decodable { }
