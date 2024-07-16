import ProjectDescription

public extension Project {
    static func makeTemp(
        name: String,
        platform: Platform,
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: .framework,
                    bundleId: "com.DsmHackathon-iOS.\(name)",
                    deploymentTarget: .iOS(
                        targetVersion: "15.0",
                        devices: [.iphone, .ipad]
                    ),
                    infoPlist: .default,
                    dependencies: dependencies
                )
            ]
        )
    }
}
