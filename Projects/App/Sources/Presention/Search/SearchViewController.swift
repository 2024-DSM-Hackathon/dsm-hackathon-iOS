import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Then

public class SearchViewController: BaseViewController<SearchViewModel> {
    private let searchTextField = UITextField().then {
        $0.placeholder = "검색할 기업을 입력해주세요"
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 18.0, height: 0.0))
        $0.rightViewMode = .always
        $0.backgroundColor = .colorF4F4F4
        $0.layer.cornerRadius = 12
    }
    private let searchImageView = UIImageView().then {
        $0.image = UIImage(named: "Search")
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
            searchTextField,
            searchImageView,
            companyListTableView
        ].forEach { view.addSubview($0) }
    }

    public override func setLayout() {
        searchTextField.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        searchImageView.snp.makeConstraints {
            $0.height.width.equalTo(24)
            $0.centerY.equalTo(searchTextField)
            $0.leading.equalTo(searchTextField.snp.leading).inset(18)
        }

        companyListTableView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(30)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    public override func bind() {}

    public override func configureViewController() {
        self.setSmallTitle(title: "검색하기")
        self.companyListTableView.dataSource = self
        self.companyListTableView.delegate = self
    }

    public override func configureNavigation() {
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CompanyListTableViewCell.identifier,
            for: indexPath
        ) as? CompanyListTableViewCell else { return UITableViewCell() }

        cell.selectionStyle = .none

        return cell
    }
}
