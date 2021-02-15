import Foundation

extension URL {

    init?(uuid: UUID) {
        self.init(string: "/\(uuid.uuidString.lowercased())")
    }

    func appendingPathComponent(_ value: Int) -> Self {
        appendingPathComponent(String(value))
    }

    func appendingPathComponent(_ value: UUID) -> Self {
        appendingPathComponent(value.uuidString.lowercased())
    }

}
