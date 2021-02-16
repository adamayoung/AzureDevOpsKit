import Foundation

/// Represents a reference to an orchestration plan.
public struct TaskOrchestrationPlanReference: Identifiable, Decodable {

    /// Alias for `planID`.
    public var id: String {
        planID
    }

    /// The ID of the plan.
    public let planID: String
    /// The type of the plan.
    public let orchestrationType: Int?

}

extension TaskOrchestrationPlanReference {

    private enum CodingKeys: String, CodingKey {
        case planID = "planId"
        case orchestrationType
    }

}
