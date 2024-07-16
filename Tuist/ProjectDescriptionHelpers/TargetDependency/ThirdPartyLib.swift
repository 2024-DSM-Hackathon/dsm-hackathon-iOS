import ProjectDescription

extension TargetDependency {

    public struct ThirdPartyLib {
        public static let thirdParty = thirdPartyLib()
    }

    private static func thirdPartyLib() -> TargetDependency {
        return TargetDependency.project(
            target: "ThirdPartyLib", path: .relativeToRoot("Projects/ThirdPartyLib")
        )
    }
}
