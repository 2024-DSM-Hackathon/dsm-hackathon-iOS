import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Then

public class ReviewViewController: BaseViewController<ReviewViewModel> {
    private let reviewTitleLabel = UILabel().then {
        $0.text = "리뷰를 작성해주세요"
        $0.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
    }
    private let reviewContentLabel = UILabel().then {
        $0.text = "회사에 대한 전체 리뷰를 작성해주세요\n당신의 리뷰를 통하여 더 나은 근로 환경을 만들어갈 수 있습니다"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.numberOfLines = 0
        $0.textColor = UIColor.color838383
    }
    public let reviewTextView = QuestionTextView().then {
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
    }

    public override func addView() {
        [
            reviewTitleLabel,
            reviewContentLabel,
            reviewTextView,
            nextButton
        ].forEach { view.addSubview($0) }
    }

    public override func setLayout() {
        reviewTitleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.leading.equalToSuperview().inset(24)
        }

        reviewContentLabel.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(60)
        }

        reviewTextView.snp.makeConstraints {
            $0.top.equalTo(reviewContentLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        nextButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(reviewTextView.snp.bottom).offset(70)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }

    public override func bind() {}

    public override func configureViewController() {
        self.setSmallTitle(title: "리뷰 작성")
    }

    public override func configureNavigation() { }
}
