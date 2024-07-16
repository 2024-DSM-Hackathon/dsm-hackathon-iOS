import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

final class SignupViewController: BaseViewController<SignupViewModel> {
    private let nameTitleLabel = UILabel().then {
        $0.text = "이름"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .black
    }
    private let nameTextField = UITextField().then {
        $0.placeholder = "이름을 입력해주세요"
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.colorE2E2E2.cgColor
        $0.addLeftAndRightView()
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

    private let signupButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.backgroundColor = UIColor.color3AB968
        $0.layer.cornerRadius = 4
    }
    private let explanLabel = UILabel().then {
        $0.text = "계정이 있으시다면?"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .black
    }
    private let goToLoginButton = UIButton(type: .system).then {
        $0.layer.borderColor = UIColor.white.cgColor
        $0.setTitle("로그인 하러가기", for: .normal)
        $0.setTitleColor(.colorA1A1AA, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    private let goToLoginStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
    }

    public override func addView() {
        [
            nameTitleLabel,
            nameTextField,
            idTitleLabel,
            idTextField,
            pwTitleLabel,
            pwTextField,
            signupButton,
            goToLoginStackView
        ].forEach { self.view.addSubview($0) }

        [
            explanLabel,
            goToLoginButton
        ].forEach { self.goToLoginStackView.addArrangedSubview($0) }
    }

    public override func setLayout() {
        nameTitleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.equalToSuperview().inset(40)
        }

        nameTextField.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.equalTo(nameTitleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        idTitleLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(40)
        }

        idTextField.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.equalTo(idTitleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        pwTitleLabel.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(40)
        }

        pwTextField.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.equalTo(pwTitleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        signupButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(pwTextField.snp.bottom).offset(120)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        explanLabel.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
        }

        goToLoginButton.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(explanLabel.snp.trailing).offset(5)
        }

        goToLoginStackView.snp.makeConstraints {
            $0.top.equalTo(signupButton.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
    }

    public override func bind() {
        let input = SignupViewModel.Input()

        let _ = viewModel.transform(input)
    }

    public override func configureViewController() {
        goToLoginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                print("로그인 화면으로!")
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }

    public override func configureNavigation() {
        self.setSmallTitle(title: "회원가입")
    }
}
