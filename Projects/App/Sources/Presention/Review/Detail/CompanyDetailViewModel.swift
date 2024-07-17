import UIKit
import RxSwift
import RxCocoa
import RxFlow

public final class CompanyDetailViewModel: BaseViewModel, Stepper {
    public let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    public var companyId = 0
    let service = Service()

    public struct Input {
        let viewAppear: PublishRelay<Void>
    }

    public struct Output {
        var companyDetailInfo = PublishRelay<CompanyModel>()
        var companyReviewInfo = PublishRelay<[AnswerList]>()
    }

    public func transform(_ input: Input) -> Output {
        let companyDetailInfo = PublishRelay<CompanyModel>()
        let companyReviewInfo = PublishRelay<[AnswerList]>()

        input.viewAppear.asObservable()
            .flatMap {
                self.service.fetchCompanyDetail(id: self.companyId)
            }
            .bind(to: companyDetailInfo)
            .disposed(by: disposeBag)

        input.viewAppear.asObservable()
            .flatMap {
                self.service.fetchCompanyReview(id: self.companyId)
            }
            .bind(to: companyReviewInfo)
            .disposed(by: disposeBag)

        return Output(
            companyDetailInfo: companyDetailInfo,
            companyReviewInfo: companyReviewInfo
        )
    }
}
