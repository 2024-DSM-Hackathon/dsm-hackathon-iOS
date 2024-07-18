import UIKit
import RxSwift
import RxCocoa
import RxFlow

public final class MyPageViewModel: BaseViewModel, Stepper {
    public let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    let service = Service()

    public struct Input {
        let viewAppear: PublishRelay<Void>
    }

    public struct Output {
        var newReviewList = PublishRelay<[NewReviewList]>()
    }

    public func transform(_ input: Input) -> Output {
        let newReviewList = PublishRelay<[NewReviewList]>()

        input.viewAppear.asObservable()
            .flatMap {
                self.service.fetchNewReview()
            }
            .bind(to: newReviewList)
            .disposed(by: disposeBag)

        return Output(
            newReviewList: newReviewList
        )
    }
}
