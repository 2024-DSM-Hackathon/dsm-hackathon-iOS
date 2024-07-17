import UIKit
import SnapKit
import Then

class CompanyDetailViewController: UIViewController {
    
    private let companyView = CompanyView()

    private let totalReviewView = TotalReviewView()

    private let reviewTitleLabel = UILabel().then {
        $0.text = "리뷰 확인하기"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    private let reviewTableview = UITableView().then {
        $0.register(
            NewReviewListTableViewCell.self,
            forCellReuseIdentifier: NewReviewListTableViewCell.identifier
        )
        $0.separatorStyle = .none
        $0.rowHeight = 161
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
    }
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    override func viewDidLoad() {
        view.backgroundColor = .white
        reviewTableview.delegate = self
        reviewTableview.dataSource = self
    }

    override func viewWillLayoutSubviews() {
        addView()
        setLayout()
    }
    private func addView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [
            companyView,
            totalReviewView,
            reviewTitleLabel,
            reviewTableview
        ].forEach { contentView.addSubview($0) }
    }
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(reviewTableview.snp.bottom).offset(30)
        }
        companyView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(70)
        }
        totalReviewView.snp.makeConstraints {
            $0.top.equalTo(companyView.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(138)
        }
        reviewTitleLabel.snp.makeConstraints {
            $0.top.equalTo(totalReviewView.snp.bottom).offset(58)
            $0.leading.equalToSuperview().inset(24)
            $0.height.equalTo(21)
        }
        reviewTableview.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.greaterThanOrEqualTo(reviewTableview.contentSize.height + 4)
        }
    }
}

extension CompanyDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NewReviewListTableViewCell.identifier,
            for: indexPath
        ) as? NewReviewListTableViewCell else { return UITableViewCell() }
        return cell
    }

}
