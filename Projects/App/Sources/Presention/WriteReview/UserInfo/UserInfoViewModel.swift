import UIKit
import RxSwift
import RxCocoa
import RxFlow

public final class UserInfoViewModel: BaseViewModel, Stepper {
    public let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    let service = Service()

    public struct Input {
        let viewAppear: PublishRelay<Void>
    }

    public struct Output {
        
    }

    public func transform(_ input: Input) -> Output {

        return Output()
    }
}
