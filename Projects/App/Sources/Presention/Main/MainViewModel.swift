import UIKit
import RxSwift
import RxCocoa
import RxFlow

public final class MainViewModel: BaseViewModel, Stepper {
    public let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    let service = Service()

    public struct Input {
        let viewAppear: PublishRelay<Void>
    }

    public struct Output {
        var companyList = PublishRelay<[CompanyList]>()
        var newReviewList = PublishRelay<[NewReviewList]>()
    }

    public func transform(_ input: Input) -> Output {
        let companyList = PublishRelay<[CompanyList]>()
        let newReviewList = PublishRelay<[NewReviewList]>()

        input.viewAppear.asObservable()
            .flatMap {
                self.service.fetchCompanyList()
            }
            .bind(to: companyList)
            .disposed(by: disposeBag)

        input.viewAppear.asObservable()
            .flatMap {
                self.service.fetchNewReview()
            }
            .bind(to: newReviewList)
            .disposed(by: disposeBag)

        return Output(
            companyList: companyList,
            newReviewList: newReviewList
        )
    }
}
