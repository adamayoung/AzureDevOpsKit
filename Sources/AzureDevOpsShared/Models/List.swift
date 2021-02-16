import Foundation

public struct List<Value: Decodable>: Decodable {

    public let value: [Value]
    public let count: Int

}
