import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Then

public class MyPageViewController: BaseViewController<MyPageViewModel> {
    private let userNameLabel = UILabel().then {
        $0.text = "limda00님"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .color2EB15D
    }
    private let userInfoLabel = UILabel().then {
        $0.text = "인프런 | 4년 | 현직원"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .color838383
    }
    private let writtenReviewLabel = UILabel().then {
        $0.text = "내가 쓴 리뷰"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
    }
//    private let writtenReviewTableView = UITableView().then {
//        $0.register(
//            NewReviewListTableViewCell.self,
//            forCellReuseIdentifier: NewReviewListTableViewCell.identifier
//        )
//        $0.separatorStyle = .none
//        $0.rowHeight = 161
//        $0.showsVerticalScrollIndicator = false
//        $0.isScrollEnabled = false
//    }
    private let logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.backgroundColor = .colorF4F4F4
        $0.setTitleColor(.color838383, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
    }

    public override func addView() {
        [
            userNameLabel,
            userInfoLabel,
            writtenReviewLabel,
//            writtenReviewTableView,
            logoutButton
        ].forEach { self.view.addSubview($0) }
    }

    public override func setLayout() {
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.equalToSuperview().inset(24)
        }

        userInfoLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.top).offset(6)
            $0.leading.equalTo(userNameLabel.snp.trailing).offset(7)
        }

        writtenReviewLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(45)
            $0.leading.equalToSuperview().inset(24)
        }

//        writtenReviewTableView.snp.makeConstraints {
//            $0.top.equalTo(writtenReviewLabel.snp.bottom).offset(6)
//            $0.leading.trailing.equalToSuperview()
//        }

        logoutButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(writtenReviewLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }

    public override func bind() {}

    public override func configureViewController() {
        self.setSmallTitle(title: "마이페이지")
//        writtenReviewTableView.delegate = self
//        writtenReviewTableView.dataSource = self
    }

    public override func configureNavigation() {
        
    }
}

//extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(
//            withIdentifier: NewReviewListTableViewCell.identifier,
//            for: indexPath
//        ) as? NewReviewListTableViewCell else { return UITableViewCell() }
//
//        return cell
//    }
//}
