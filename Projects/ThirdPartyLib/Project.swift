import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeTemp(
    name: "ThirdPartyLib",
    platform: .iOS,
    dependencies: [
        .SPM.RxCocoa,
        .SPM.RxSwift,
        .SPM.RxFlow,
        .SPM.Moya,
        .SPM.RxMoya,
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Kingfisher,
        .SPM.HangulSearch
//        .SPM.Dropdown
//        .SPM.Dropdown
    ]
)
