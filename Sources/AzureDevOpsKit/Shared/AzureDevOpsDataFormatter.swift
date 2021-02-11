import Foundation

final class AzureDevOpsDateFormatter: DateFormatter {

    override init() {
        super.init()
        dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        timeZone = TimeZone(secondsFromGMT: 0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
