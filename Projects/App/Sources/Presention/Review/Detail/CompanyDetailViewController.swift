import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class CompanyDetailViewController: UIViewController {
    let companyDetailViewModel = CompanyDetailViewModel()
    let userInfoViewController = UserInfoViewController(UserInfoViewModel())
    public var viewWillAppearPublisher = PublishRelay<Void>()
    let disposeBag = DisposeBag()
    var companyId: Int = 0
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
    private let goToWriteButton = UIButton().then {
//        $0.setImage(UIImage(named: "WriteImage"), for: .normal)
        $0.backgroundColor = .color2EB15D
        $0.layer.cornerRadius = 27.5
    }
    private let writeImageView = UIImageView().then {
        $0.image = UIImage(named: "WriteImage")
    }
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        companyDetailViewModel.companyId = self.companyId
//        bind()

        goToWriteButton.rx.tap.asObservable()
            .subscribe(onNext: {
                self.navigationController?.pushViewController(self.userInfoViewController, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    override func viewWillLayoutSubviews() {
        view.backgroundColor = .white
        addView()
        setLayout()
    }
    
    public func addView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [
            companyView,
            totalReviewView,
            reviewTitleLabel,
            reviewTableview
        ].forEach { contentView.addSubview($0) }
        view.addSubview(goToWriteButton)
        goToWriteButton.addSubview(writeImageView)
    }
    
    public func setLayout() {
        goToWriteButton.snp.makeConstraints {
            $0.height.width.equalTo(54)
            $0.trailing.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(45)
        }

        writeImageView.snp.makeConstraints {
            $0.height.width.equalTo(24)
            $0.centerX.centerY.equalToSuperview()
        }

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

//    public func bind() {
//        let input = CompanyDetailViewModel.Input(
//            viewAppear: self.viewWillAppearPublisher
//        )
//
//        let output = self.companyDetailViewModel.transform(input)
//
//        output.companyDetailInfo
//            .bind(onNext: { item in
//                self.companyView.companyLabel.text = item.company
//                self.companyView.companyDescriptionLabel.text = item.info
//                self.companyView.categoryLabel.text = item.industry_sector
//                self.totalReviewView.reviewCountLabel.text = "\(item.company_rating)"
//                self.totalReviewView.moneyProgressView.setProgress(Float(item.ratingList[0].rate/5), animated: true)
//                self.totalReviewView.workProgressView.setProgress(Float(item.ratingList[1].rate/5), animated: true)
//                self.totalReviewView.cultureProgressView.setProgress(Float(item.ratingList[2].rate/5), animated: true)
//                self.totalReviewView.workEnvProgressView.setProgress(Float(item.ratingList[3].rate/5), animated: true)
//            })
//            .disposed(by: disposeBag)

//        output.companyReviewInfo
//            .bind(
//                to: reviewTableview.rx.items(
//                    cellIdentifier: CompanyReviewTableViewCell.identifier,
//                    cellType: CompanyReviewTableViewCell.self
//                )) { _, element, cell in
//                    cell.adapt(model: element)
//                    cell.adapt(company: companyView.companyLabel)
//                }
//                .disposed(by: disposeBag)
//    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewWillAppearPublisher.accept(())
    }
}
