import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

final class CompanyListTableViewCell: BaseTableViewCell<CompanyList> {
    static let identifier = "CompanyListTableViewCell"
    private var disposeBag = DisposeBag()
    private let companyImageView = UIImageView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 8
    }
    private let companyTitleLabel = UILabel().then {
        $0.text = "인프런"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    private let arrowImageView = UIImageView().then {
        $0.image = UIImage(named: "RightArrow")
    }
    private let pointLabel = UILabel().then {
        $0.text = "★ 5.0"
    }
    private let companyInfoLabel = UILabel().then {
        $0.text = "기업정보 내용 기업정보 내용 기업정보"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    private let serviceTypeMenuLabel = UILabel().then {
        $0.text = "업종 분야"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    private let serviceTypeLabel = UILabel().then {
        $0.text = "교육"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    }

    override func addView() {
        [
            companyImageView,
            companyTitleLabel,
            arrowImageView,
            pointLabel,
            companyInfoLabel,
            serviceTypeMenuLabel,
            serviceTypeLabel
        ].forEach {
            contentView.addSubview($0)
        }
    }

    override func setLayout() {
        companyImageView.snp.makeConstraints {
            $0.height.width.equalTo(80)
            $0.top.bottom.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(25)
        }

        companyTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalTo(companyImageView.snp.trailing).offset(20)
        }

        arrowImageView.snp.makeConstraints {
            $0.height.width.equalTo(20)
            $0.centerY.equalTo(companyTitleLabel)
            $0.leading.equalTo(companyTitleLabel.snp.trailing)
        }

        pointLabel.snp.makeConstraints {
            $0.top.equalTo(companyTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(companyImageView.snp.trailing).offset(20)
        }

        companyInfoLabel.snp.makeConstraints {
            $0.top.equalTo(pointLabel.snp.bottom).offset(4)
            $0.leading.equalTo(companyImageView.snp.trailing).offset(20)
        }

        serviceTypeMenuLabel.snp.makeConstraints {
            $0.top.equalTo(companyInfoLabel.snp.bottom)
            $0.leading.equalTo(companyImageView.snp.trailing).offset(20)
        }

        serviceTypeLabel.snp.makeConstraints {
            $0.top.equalTo(companyInfoLabel.snp.bottom)
            $0.leading.equalTo(serviceTypeMenuLabel.snp.trailing).offset(4)
        }
    }

    override func configureView() {
//        self.backgroundColor = .GrayScale.gray30
    }

    public override func adapt(model: CompanyList) {
        self.model = model

        companyImageView.setWantImage(
            urlString: model.logo
        )
        companyTitleLabel.text = model.company
        pointLabel.text = "★ \(model.rating)"
        companyInfoLabel.text = model.info
        serviceTypeLabel.text = model.industrySector
    }
}
