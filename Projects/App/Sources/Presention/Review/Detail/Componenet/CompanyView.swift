import UIKit
import SnapKit
import Then

class CompanyView: BaseView<Any> {

    public let logoImageView = UIImageView().then {
        $0.layer.cornerRadius = 8
        $0.image = UIImage(named: "InLogo")
    }
    public let companyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.text = "asda"
    }
    public let companyDescriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .gray
        $0.text = "asda"
    }
    public let categoryLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.text = "asda"
    }
    private lazy var labelStackView = UIStackView(arrangedSubviews: [
        companyLabel,
        companyDescriptionLabel,
        categoryLabel
    ]).then {
        $0.spacing = 7
        $0.axis = .vertical
    }
    override func addView() {
        [
            logoImageView,
            labelStackView
        ].forEach { addSubview($0) }
    }
    override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.width.height.equalTo(70)
            $0.centerY.equalToSuperview()
        }
        labelStackView.snp.makeConstraints {
            $0.leading.equalTo(logoImageView.snp.trailing).offset(20)
        }
    }
}
