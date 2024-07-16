import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

final class NewReviewListTableViewCell: BaseTableViewCell<Any> {
    static let identifier = "NewReviewListTableViewCell"
    private var disposeBag = DisposeBag()

    private let containerView = UIView().then {
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.color2EB15D.cgColor
    }
    private let reviewerInfoLabel = UILabel().then {
        $0.text = "인프런 | 4년 | 현직원"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    private let reviewContentLabel = UILabel().then {
        $0.text = "이 회사에 대한 리뷰가 여기에 있습니다 이 회사에 대한 리뷰가 여기에 있습니다 이 회사에 대한 리뷰가 여기에 있습니다 이 회사에 대한 리뷰가 여기에 있습니다 "
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.numberOfLines = 0
    }
    private let pointStarImageView = UIImageView().then {
        $0.image = UIImage(named: "Star")
    }
    private let pointLabel = UILabel().then {
        $0.text = "5.0"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .color2EB15D
    }
    private let reviewDateLabel = UILabel().then {
        $0.text = "2024.07.16"
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .color838383
    }

    override func addView() {
        contentView.addSubview(containerView)
        [
            reviewerInfoLabel,
            reviewContentLabel,
            pointStarImageView,
            pointLabel,
            reviewDateLabel
        ].forEach { self.containerView.addSubview($0) }
    }

    override func setLayout() {
        containerView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(6)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        reviewerInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(28)
        }

        reviewContentLabel.snp.makeConstraints {
            $0.top.equalTo(reviewerInfoLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(28)
        }

        pointStarImageView.snp.makeConstraints {
            $0.height.width.equalTo(24)
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(28)
        }

        pointLabel.snp.makeConstraints {
            $0.centerY.equalTo(pointStarImageView)
            $0.leading.equalTo(pointStarImageView.snp.trailing).offset(5)
        }

        reviewDateLabel.snp.makeConstraints {
            $0.centerY.equalTo(pointStarImageView)
            $0.trailing.equalToSuperview().inset(28)
        }
    }

    override func configureView() {
    }
}
