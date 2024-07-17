import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Then

public class CompanyListViewController: BaseViewController<CompanyListViewModel> {
    private let colorView = UIView().then {
        $0.backgroundColor = UIColor.colorF4F4F4
    }
    private let explanLabel = UILabel().then {
        $0.text = "리뷰 및 평가를 확인하고 원하는 기업을 찾아보세요!!"
        $0.textColor = UIColor.color838383
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    private let companyListTableView = UITableView().then {
        $0.register(
            CompanyListTableViewCell.self,
            forCellReuseIdentifier: CompanyListTableViewCell.identifier
        )
        $0.separatorStyle = .none
        $0.rowHeight = 120
        $0.showsVerticalScrollIndicator = false
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
    }

    public override func addView() {
        [
            colorView,
            explanLabel,
            companyListTableView
        ].forEach { self.view.addSubview($0) }
    }

    public override func setLayout() {
        colorView.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(4)
            $0.leading.trailing.equalToSuperview()
        }
        explanLabel.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide).inset(4)
            $0.centerY.equalTo(colorView)
            $0.leading.equalToSuperview().inset(15)
        }

        companyListTableView.snp.makeConstraints {
            $0.top.equalTo(explanLabel.snp.bottom).offset(4)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    public override func bind() {
        let input = CompanyListViewModel.Input(
            viewAppear: self.viewDidLoadPublisher
        )

        let output = viewModel.transform(input)

        output.companyList
            .bind(
                to: companyListTableView.rx.items(
                    cellIdentifier: CompanyListTableViewCell.identifier,
                    cellType: CompanyListTableViewCell.self
                )) { _, element, cell in
                    cell.adapt(model: element)
                }
                .disposed(by: disposeBag)
    }

    public override func configureViewController() { }

    public override func configureNavigation() {
        self.setSmallTitle(title: "기업 둘러보기")
    }
}
