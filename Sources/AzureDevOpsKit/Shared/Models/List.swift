import Foundation

struct List<Value: Decodable>: Decodable {

    let value: [Value]
    let count: Int

}
