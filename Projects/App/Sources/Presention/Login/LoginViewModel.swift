import UIKit
import RxSwift
import RxCocoa
import RxFlow

public final class LoginViewModel: BaseViewModel, Stepper {
    public let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    let service = Service()
    public struct Input {
        let idText: Observable<String>
        let passwordText: Observable<String>
        let loginButtonTapped: Observable<Void>
    }

    public struct Output {
        let loginIsSuccess: Observable<Void>
    }

    public func transform(_ input: Input) -> Output {
        let info = Observable.combineLatest(
            input.idText,
            input.passwordText
        )
        let loginIsSuccess = PublishRelay<Void>()
        input.loginButtonTapped
            .withLatestFrom(info)
            .flatMap { id, password in
                self.service.login(id: id, password: password)
            }
            .subscribe(onNext: { res in
                switch res {
                case .ok:
                    loginIsSuccess.accept(())
                default:
                    print("로그인 실패")
                }
            })
            .disposed(by: disposeBag)

        
        return Output(loginIsSuccess: loginIsSuccess.asObservable())
    }
}
