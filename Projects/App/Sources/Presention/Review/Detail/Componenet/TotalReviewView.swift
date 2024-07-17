import UIKit
import SnapKit
import Then

class TotalReviewView: BaseView<Any> {

    private var progressView: [UIProgressView] = []
    
    private let titleLabel = UILabel().then {
        $0.text = "전체 리뷰 통계"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    private let reviewBackgroundView = UIView().then {
        $0.backgroundColor = .colorF5F5FD
        $0.layer.cornerRadius = 8
    }
    private let reviewCountLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 30, weight: .medium)
        $0.text = "5.0"
    }
    private let reviewTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.text = "평균 별점"
    }
    private lazy var reviewStackView = UIStackView(arrangedSubviews: [
        reviewCountLabel,
        reviewTitleLabel
    ]).then {
        $0.axis = .vertical
        $0.spacing = 7
    }

    private let moneyLabel = UILabel().then {
        $0.text = "급여"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textAlignment = .right
    }
    private let moneyProgressView = UIProgressView().then {
        $0.layer.cornerRadius = 3
    }
    private let workLifeLabel = UILabel().then {
        $0.text = "워라벨"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textAlignment = .right
    }
    private let workProgressView = UIProgressView()

    private let cultureLabel = UILabel().then {
        $0.text = "직장문화"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    private let cultureProgressView = UIProgressView().then {
        $0.layer.cornerRadius = 3
    }
    private let workEnvLabel = UILabel().then {
        $0.text = "근무환경"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    private let workEnvProgressView = UIProgressView().then {
        $0.layer.cornerRadius = 3
    }
    private lazy var titleStackView = UIStackView(arrangedSubviews: [
        moneyLabel,
        workLifeLabel,
        cultureLabel,
        workEnvLabel
    ]).then {
        $0.axis = .vertical
        $0.spacing = 4
        $0.distribution = .fillEqually
    }

    override func addView() {
        [
            titleLabel,
            reviewBackgroundView
        ].forEach { addSubview($0) }
        [
            reviewStackView,
            titleStackView,
            moneyProgressView,
            workProgressView,
            cultureProgressView,
            workEnvProgressView,
        ].forEach { reviewBackgroundView.addSubview($0) }
    }
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(14)
        }
        reviewBackgroundView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        reviewStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(35)
        }
        titleStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(reviewStackView.snp.trailing).offset(38)
        }
        moneyProgressView.snp.makeConstraints {
            $0.centerY.equalTo(moneyLabel)
            $0.leading.equalTo(moneyLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(35)
            $0.height.equalTo(6)
        }
        workProgressView.snp.makeConstraints {
            $0.centerY.equalTo(workLifeLabel)
            $0.leading.equalTo(workLifeLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(35)
            $0.height.equalTo(6)
        }
        cultureProgressView.snp.makeConstraints {
            $0.centerY.equalTo(cultureLabel)
            $0.leading.equalTo(cultureLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(35)
            $0.height.equalTo(6)
        }
        workEnvProgressView.snp.makeConstraints {
            $0.centerY.equalTo(workEnvLabel)
            $0.leading.equalTo(workEnvLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(35)
            $0.height.equalTo(6)
        }
 
    }
//    func createCaseView() {
//        let cases = ["급여", "워라벨", "직장문화", "근무환경"]
//        for title in cases {
//            let stackView = createProgress(title: title)
//            progressStackView.addArrangedSubview(stackView)
//        }
//    }
//    func createProgress(title: String) -> UIStackView {
//        let containerView = UIView()
//        let titleLabel = UILabel()
//        titleLabel.text = title
//        titleLabel.font = .systemFont(ofSize: 12, weight: .medium)
//
//        let progressView = UIProgressView(progressViewStyle: .default)
//
//        let stackView = UIStackView(arrangedSubviews: [
//            titleLabel,
//            progressView
//        ])
//        stackView.axis = .vertical
//        stackView.spacing = 8
//    
//    return stackView
//    }
    
}

