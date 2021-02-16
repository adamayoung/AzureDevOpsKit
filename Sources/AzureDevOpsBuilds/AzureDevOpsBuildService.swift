import AzureDevOpsCore
import AzureDevOpsShared
import Foundation

public final class AzureDevOpsBuildService: BuildService {

    private let buildRepository: BuildRepository
    private let userCredential: UserCredential

    init(userCredential: UserCredential, buildRepository: BuildRepository) {
        self.userCredential = userCredential
        self.buildRepository = buildRepository
    }

    public convenience init(userCredential: UserCredential) {
        let buildRepository = BuildHTTPRepository()

        self.init(userCredential: userCredential, buildRepository: buildRepository)
    }

    public func fetchAllBuilds(inProject projectID: TeamProject.ID,
                               completion: @escaping (Result<[Build], AzureDevOpsError>) -> Void) {
        buildRepository.fetchAll(inProject: projectID, userCredential: userCredential) { result in
            completion(result.map(\.value))
        }
    }

    public func fetch(build buildID: Build.ID, inProject projectID: TeamProject.ID,
                      completion: @escaping (Result<Build, AzureDevOpsError>) -> Void) {
        buildRepository.fetch(build: buildID, inProject: projectID, userCredential: userCredential,
                              completion: completion)
    }

}

