import UIKit
import RxSwift
import RxCocoa
import RxFlow

public final class SignupViewModel: BaseViewModel, Stepper {
    public let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    let service = Service()

    public struct Input {
        let nameText: Observable<String>
        let idText: Observable<String>
        let pwText: Observable<String>
        let signupButtonDidTap: Observable<Void>
    }

    public struct Output {
        let signupIsSuccess: Observable<Void>
    }

    public func transform(_ input: Input) -> Output {
        let info = Observable.combineLatest(
            input.nameText,
            input.idText,
            input.pwText
        )
        let signupIsSuccess = PublishRelay<Void>()

        input.signupButtonDidTap
            .withLatestFrom(info)
            .flatMap { name, id, password in
                self.service.signup(
                    name: name,
                    id: id,
                    password: password
                )
            }
            .subscribe(onNext: { _ in
                signupIsSuccess.accept(())
            })
//            .subscribe(onNext: { res in
//                switch res {
//                case .ok:
//                    signupIsSuccess.accept(())
//                default:
//                    print("회원가입 실패")
//                }
//            })
            .disposed(by: disposeBag)

        return Output(signupIsSuccess: signupIsSuccess.asObservable())
    }
}
