import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Then

public class UserInfoViewController: BaseViewController<UserInfoViewModel> {
    let questionViewController = QuestionViewController(QuestionViewModel())
    private let userInfoTitleLabel = UILabel().then {
        $0.text = "사용자 정보 입력해주세요"
        $0.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
    }
    private let userInfoContentLabel = UILabel().then {
        $0.text = "현 직장에 관하여 정보를 입력해주세요"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .color838383
    }
    private let typeMenuLabel = UILabel().then {
        $0.text = "분야"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    private let typeTextField = UITextField().then {
        $0.placeholder = "분야를 입력해주세요"
        $0.backgroundColor = .colorF5F5FD
        $0.layer.cornerRadius = 4
        $0.addLeftAndRightView()
    }
    private let annualMenuLabel = UILabel().then {
        $0.text = "연차"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    private let annualTextField = UITextField().then {
        $0.placeholder = "연차를 입력해주세요"
        $0.backgroundColor = .colorF5F5FD
        $0.layer.cornerRadius = 4
        $0.addLeftAndRightView()
    }
    private let statusMenuLabel = UILabel().then {
        $0.text = "현상태"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    private let statusTextField = UITextField().then {
        $0.placeholder = "현재 상태를 입력해주세요. (전직원/현직원)"
        $0.backgroundColor = .colorF5F5FD
        $0.layer.cornerRadius = 4
        $0.addLeftAndRightView()
    }
    private let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .color3AB968
        $0.layer.cornerRadius = 4
    }
//    private let annualLabel = UILabel().then {
//        
//    }


    public override func addView() {
        [
            userInfoTitleLabel,
            userInfoContentLabel,
            typeMenuLabel,
            typeTextField,
            annualMenuLabel,
            annualTextField,
            statusMenuLabel,
            statusTextField,
            nextButton
        ].forEach { view.addSubview($0) }
    }

    public override func setLayout() {
        userInfoTitleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.leading.equalToSuperview().inset(24)
        }

        userInfoContentLabel.snp.makeConstraints {
            $0.top.equalTo(userInfoTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(24)
        }

        typeMenuLabel.snp.makeConstraints {
            $0.top.equalTo(userInfoContentLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(24)
        }

        typeTextField.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(typeMenuLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        annualMenuLabel.snp.makeConstraints {
            $0.top.equalTo(typeTextField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(24)
        }

        annualTextField.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(annualMenuLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        statusMenuLabel.snp.makeConstraints {
            $0.top.equalTo(annualTextField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(24)
        }

        statusTextField.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(statusMenuLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        nextButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().inset(80)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }

    public override func bind() {
        let input = UserInfoViewModel.Input(
            viewAppear: self.viewWillAppearPublisher
        )

        let _ = viewModel.transform(input)
    }

    public override func configureViewController() {
        nextButton.rx.tap
            .subscribe(onNext: {
                self.navigationController?.pushViewController(self.questionViewController, animated: true)
                self.questionViewController.typeText = self.typeTextField.text ?? ""
                self.questionViewController.annualText = self.annualTextField.text ?? ""
                self.questionViewController.statusText = self.statusTextField.text ?? ""
            })
            .disposed(by: disposeBag)
    }

    public override func configureNavigation() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.setSmallTitle(title: "리뷰 작성")
    }
}
