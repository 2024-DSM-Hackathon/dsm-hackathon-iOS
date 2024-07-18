import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Then

struct answerListInfo {
    let questionId: Int
    let answer: String
    let rating: Int
}

public class QuestionViewController: BaseViewController<QuestionViewModel> {
    var reviewViewController = ReviewViewController(ReviewViewModel())
    public var typeText: String = ""
    public var annualText: String = ""
    public var statusText: String = ""

    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    private let contentView = UIView()
    private let reviewTitleLabel = UILabel().then {
        $0.text = "리뷰를 작성해주세요"
        $0.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
    }
    private let reviewContentLabel = UILabel().then {
        $0.text = "회사와 관련하여 자세한 리뷰를 작성해주세요\n당신의 리뷰를 통하여 더 나은 근로 환경을 만들어갈 수 있습니다"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.numberOfLines = 0
        $0.textColor = UIColor.color838383
    }
    private let rewardLabel = UILabel().then {
        $0.text = "1. 급여"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    public let rewardPointTextField = UITextField().then {
        $0.placeholder = "급여에 대한 점수를 입력해주세요(1 ~ 5)"
        $0.addLeftAndRightView()
        $0.backgroundColor = .colorF4F4F4
        $0.layer.cornerRadius = 4
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    public let rewardPointTextView = QuestionTextView().then {
        $0.setTextField(placeholder: "리뷰를 작성해주세요 (200자 이내)")
    }

    private let ruleLabel = UILabel().then {
        $0.text = "2. 워라벨"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    public let rulePointTextField = UITextField().then {
        $0.placeholder = "워라벨에 대한 점수를 입력해주세요(1 ~ 5)"
        $0.addLeftAndRightView()
        $0.backgroundColor = .colorF4F4F4
        $0.layer.cornerRadius = 4
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    public let rulePointTextView = QuestionTextView().then {
        $0.setTextField(placeholder: "리뷰를 작성해주세요 (200자 이내)")
    }

    private let workPlaceLabel = UILabel().then {
        $0.text = "3. 근무환경"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    public let workPlacePointTextField = UITextField().then {
        $0.placeholder = "근무환경에 대한 점수를 입력해주세요(1 ~ 5)"
        $0.addLeftAndRightView()
        $0.backgroundColor = .colorF4F4F4
        $0.layer.cornerRadius = 4
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    public let workPlacePointTextView = QuestionTextView().then {
        $0.setTextField(placeholder: "리뷰를 작성해주세요 (200자 이내)")
    }

    private let companyCultureLabel = UILabel().then {
        $0.text = "4. 직장문화"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    public let companyCulturePointTextField = UITextField().then {
        $0.placeholder = "급여에 대한 점수를 입력해주세요(1 ~ 5)"
        $0.addLeftAndRightView()
        $0.backgroundColor = .colorF4F4F4
        $0.layer.cornerRadius = 4
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    public let companyCulturePointTextView = QuestionTextView().then {
        $0.setTextField(placeholder: "리뷰를 작성해주세요 (200자 이내)")
    }
    private let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .color3AB968
        $0.layer.cornerRadius = 4
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
        print(typeText)
        print(annualText)
        print(statusText)
    }

    public override func addView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [
            reviewTitleLabel,
            reviewContentLabel,
            rewardLabel,
            rewardPointTextField,
            rewardPointTextView,
            ruleLabel,
            rulePointTextField,
            rulePointTextView,
            workPlaceLabel,
            workPlacePointTextField,
            workPlacePointTextView,
            companyCultureLabel,
            companyCulturePointTextField,
            companyCulturePointTextView,
            nextButton
        ].forEach { contentView.addSubview($0) }
    }

    public override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(nextButton.snp.bottom).offset(40)
        }

        reviewTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(24)
        }

        reviewContentLabel.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(60)
        }

        rewardLabel.snp.makeConstraints {
            $0.top.equalTo(reviewContentLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(24)
        }

        rewardPointTextField.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.equalTo(rewardLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        rewardPointTextView.snp.makeConstraints {
            $0.top.equalTo(rewardPointTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        ruleLabel.snp.makeConstraints {
            $0.top.equalTo(rewardPointTextView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(24)
        }

        rulePointTextField.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.equalTo(ruleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        rulePointTextView.snp.makeConstraints {
            $0.top.equalTo(rulePointTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        workPlaceLabel.snp.makeConstraints {
            $0.top.equalTo(rulePointTextView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(24)
        }

        workPlacePointTextField.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.equalTo(workPlaceLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        workPlacePointTextView.snp.makeConstraints {
            $0.top.equalTo(workPlacePointTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        companyCultureLabel.snp.makeConstraints {
            $0.top.equalTo(workPlacePointTextView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(24)
        }

        companyCulturePointTextField.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.equalTo(companyCultureLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        companyCulturePointTextView.snp.makeConstraints {
            $0.top.equalTo(companyCulturePointTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        nextButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(companyCulturePointTextView.snp.bottom).offset(70)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }

    public override func bind() {}

    public override func configureViewController() {
        self.setSmallTitle(title: "리뷰 작성")
        nextButton.rx.tap
            .subscribe(onNext: { [weak self] in
//                let answerInfoList: [answerListInfo] = []
                self?.reviewViewController.typeText = self?.typeText ?? ""
                self?.reviewViewController.annualText = self?.annualText ?? ""
                self?.reviewViewController.statusText = self?.statusText ?? ""

//                self?.reviewViewController.answerInfoList.append(answerListInfo(
//                    questionId: 1,
//                    answer: self?.rewardPointTextView.textView.text ?? "",
//                    rating: 4
//                ))
//                self?.reviewViewController.answerListInfo.append(answerListInfo(
//                    questionId: 2,
//                    answer: self?.rulePointTextView.textView.text ?? "",
//                    rating: 3
//                ))
//                self?.reviewViewController.answerListInfo.append(answerListInfo(
//                    questionId: 3,
//                    answer: self?.workPlacePointTextView.textView.text ?? "",
//                    rating: 2
//                ))
//                self?.reviewViewController.answerListInfo.append(answerListInfo(
//                    questionId: 4,
//                    answer: self?.companyCulturePointTextView.textView.text ?? "",
//                    rating: 5
//                ))
                self?.navigationController?.pushViewController(
                    self!.reviewViewController,
                    animated: true
                )
            })
            .disposed(by: disposeBag)
    }

    public override func configureNavigation() { }
}
