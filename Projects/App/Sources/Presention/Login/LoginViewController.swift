import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

final class LoginViewController: BaseViewController<LoginViewModel> {
    private let signupViewController = SignupViewController(SignupViewModel())
    private let mainViewController = MainViewController(MainViewModel())

    private let logoImageView = UIImageView().then {
        $0.layer.cornerRadius = 50
        $0.image = UIImage(named: "Logo")
    }
    private let titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        $0.text = "더 나은 노동환경을 위한"
        $0.textColor = .color108E3D
    }
    private let contentLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.text = "WorkerAuthorityNetworkingTask"
        $0.textColor = .colorA1A1AA
    }
    private let idTitleLabel = UILabel().then {
        $0.text = "아이디"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .black
    }
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요"
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.colorE2E2E2.cgColor
        $0.addLeftAndRightView()
    }
    private let pwTitleLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .black
    }
    private let pwTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.colorE2E2E2.cgColor
        $0.addLeftAndRightView()
    }
    private let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.layer.cornerRadius = 4
        $0.backgroundColor = .color3AB968
    }
    private let explanLabel = UILabel().then {
        $0.text = "계정이 없으세요?"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .black
    }
    private let goToSignupButton = UIButton(type: .system).then {
        $0.layer.borderColor = UIColor.white.cgColor
        $0.setTitle("회원가입 하러가기", for: .normal)
        $0.setTitleColor(.colorA1A1AA, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    private let goToSignupStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
    }

    public override func addView() {
        [
            logoImageView,
            titleLabel,
            contentLabel,
            idTitleLabel,
            idTextField,
            pwTitleLabel,
            pwTextField,
            loginButton,
            goToSignupStackView
        ].forEach { self.view.addSubview($0) }

        [
            explanLabel,
            goToSignupButton
        ].forEach { self.goToSignupStackView.addSubview($0) }
    }

    public override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.height.width.equalTo(50)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().inset(40)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(40)
        }

        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(40)
        }

        idTitleLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(70)
            $0.leading.equalToSuperview().inset(40)
        }

        idTextField.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.equalTo(idTitleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        pwTitleLabel.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(40)
        }

        pwTextField.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.equalTo(pwTitleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        loginButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(pwTextField.snp.bottom).offset(70)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        explanLabel.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
        }

        goToSignupButton.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(explanLabel.snp.trailing).offset(2)
        }

        goToSignupStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
    }

    public override func bind() {
        let input = LoginViewModel.Input(
            idText: idTextField.rx.text.orEmpty.asObservable(),
            passwordText: pwTextField.rx.text.orEmpty.asObservable(),
            loginButtonTapped: loginButton.rx.tap.asObservable()
            
        )

        let output = viewModel.transform(input)
        output.loginIsSuccess
            .subscribe(onNext: {
                self.navigationController?.pushViewController(
                    self.mainViewController,
                    animated: true
                )
            })
            .disposed(by: disposeBag)
    }

    public override func configureViewController() {
//        loginButton.rx.tap.asObservable()
//            .subscribe(onNext: {
//                self.navigationController?.pushViewController(
//                    self.mainViewController,
//                    animated: true
//                )
//            })
//            .disposed(by: disposeBag)

        goToSignupButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.pushViewController(
                    self!.signupViewController,
                    animated: true
                )
            })
            .disposed(by: disposeBag)
    }

    public override func configureNavigation() {}
}
