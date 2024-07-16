import UIKit
import SnapKit
import Then

class CompanyDetailViewController: UIViewController {

    private let companyView = CompanyView()

    private let totalReviewView = TotalReviewView()

    override func viewDidLoad() {
        view.backgroundColor = .white
        addView()
        setLayout()
    }
    private func addView() {
        [
            companyView,
            totalReviewView
        ].forEach { view.addSubview($0) }
    }
    private func setLayout() {
        companyView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(70)
        }
        totalReviewView.snp.makeConstraints {
            $0.top.equalTo(companyView.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(138)
        }
    }
}
