import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Then

public class MainViewController: BaseViewController<MainViewModel> {
//    let companyListViewController = CompanyListViewController(CompanyListViewModel())
//    let myPageViewController = MyPageViewController(MyPageViewModel())
    let searchViewController = SearchViewController(SearchViewModel())

    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
    }
    private let contentView = UIView()
    private let navigationBarLogoButton = UIButton().then {
        $0.setImage(UIImage(named: "Logo"), for: .normal)
    }
    private let navigationBarSearchButton = UIButton().then {
        $0.setImage(UIImage(named: "Search"), for: .normal)
    }
    private let navigationBarProfileButton = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private let bannerImageView = UIImageView().then {
        $0.image = UIImage(named: "Banner")
    }
    private let companyInfoTitleLabel = UILabel().then {
        $0.text = "기업 정보"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    private let navigateToCompanyInfoAllButton = UIButton().then {
        $0.setTitle("전체보기", for: .normal)
        $0.setTitleColor(.color838383, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    private let companyListTableView = UITableView().then {
        $0.register(
            CompanyListTableViewCell.self,
            forCellReuseIdentifier: CompanyListTableViewCell.identifier
        )
        $0.separatorStyle = .none
        $0.rowHeight = 120
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
    }
    private let newReviewListLabel = UILabel().then {
        $0.text = "최신 리뷰 보러가기"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    private let newReviewTableView = UITableView().then {
        $0.register(
            NewReviewListTableViewCell.self,
            forCellReuseIdentifier: NewReviewListTableViewCell.identifier
        )
        $0.separatorStyle = .none
        $0.rowHeight = 161
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    public override func addView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [
            bannerImageView,
            companyInfoTitleLabel,
            navigateToCompanyInfoAllButton,
            companyListTableView,
            newReviewListLabel,
            newReviewTableView
        ].forEach { contentView.addSubview($0) }
    }
    private let stackView = UIStackView().then {
        $0.axis = .vertical
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
            $0.bottom.equalTo(newReviewTableView.snp.bottom).offset(30)
        }
        navigationBarLogoButton.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(60)
        }

        navigationBarProfileButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }

        navigationBarSearchButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }

        bannerImageView.snp.makeConstraints {
            $0.height.equalTo(107)
            $0.top.equalToSuperview().inset(11)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        companyInfoTitleLabel.snp.makeConstraints {
            $0.top.equalTo(bannerImageView.snp.bottom).offset(45)
            $0.leading.equalToSuperview().inset(24)
        }

        navigateToCompanyInfoAllButton.snp.makeConstraints {
            $0.centerY.equalTo(companyInfoTitleLabel)
            $0.trailing.equalToSuperview().inset(24)
        }

        companyListTableView.snp.makeConstraints {
            $0.height.equalTo(360)
            $0.top.equalTo(companyInfoTitleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }

        newReviewListLabel.snp.makeConstraints {
            $0.top.equalTo(companyListTableView.snp.bottom).offset(95)
            $0.leading.equalToSuperview().inset(23)
        }

        newReviewTableView.snp.makeConstraints {
            $0.top.equalTo(newReviewListLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.greaterThanOrEqualTo(newReviewTableView.contentSize.height + 4)
        }
    }

    public override func bind() {}

    public override func configureViewController() {
        companyListTableView.delegate = self
        newReviewTableView.delegate = self
        companyListTableView.dataSource = self
        newReviewTableView.dataSource = self

        navigateToCompanyInfoAllButton.rx.tap
            .subscribe(onNext: { [weak self] in
//                self?.navigationController?.pushViewController(
//                    self!.companyListViewController,
//                    animated: true
//                )
            })
            .disposed(by: disposeBag)

//        navigationBarProfileButton.rx.tap
//            .subscribe(onNext: { [weak self] in
//                self?.navigationController?.pushViewController(
//                    self!.myPageViewController,
//                    animated: true
//                )
//            })
//            .disposed(by: disposeBag)
        navigationBarSearchButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.pushViewController(
                    self!.searchViewController,
                    animated: true
                )
            })
            .disposed(by: disposeBag)
    }

    public override func configureNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationBarLogoButton)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: navigationBarProfileButton),
            UIBarButtonItem(customView: navigationBarSearchButton)
        ]
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case companyListTableView:
            return 3
        case newReviewTableView:
            return 2
        default:
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case companyListTableView:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CompanyListTableViewCell.identifier,
                for: indexPath
            ) as? CompanyListTableViewCell else { return UITableViewCell() }

            cell.selectionStyle = .none

            return cell
        case newReviewTableView:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NewReviewListTableViewCell.identifier,
                for: indexPath
            ) as? NewReviewListTableViewCell else { return UITableViewCell() }

            cell.selectionStyle = .none

            return cell
        default:
            return UITableViewCell()
        }
    }
}
