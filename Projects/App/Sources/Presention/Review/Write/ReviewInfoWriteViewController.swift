//import UIKit
//import SnapKit
//import Then
//
//class ReviewInfoWriteViewController: UIViewController {
//
//    private let titleLabel = UILabel().then {
//        $0.text = "사용자 정보 입력해주세요"
//        $0.font = .systemFont(ofSize: 24, weight: .semibold)
//    }
//    private let detailLabel = UILabel().then {
//        $0.text = "현 직장에 관하여 정보를 입력해주세요"
//        $0.font = .systemFont(ofSize: 14, weight: .medium)
//        $0.textColor = .color838383
//    }
//
//    override func viewDidLoad() {
//        addView()
//        setLayout()
//    }
//    private func addView() {
//        [
//            titleLabel,
//            detailLabel
//        ].forEach { view.addSubview($0) }
//    }
//    private func setLayout() {
//        titleLabel.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
//            $0.leading.equalToSuperview().inset(24)
//            $0.height.equalTo(29)
//        }
//        detailLabel.snp.makeConstraints {
//            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
//            $0.leading.equalToSuperview().inset(24)
//            $0.height.equalTo(17)
//        }
//    }
//}

import UIKit
import SnapKit
import Then

class ReviewInfoWriteViewController: UIViewController {
    private let titleLabel = UILabel().then {
        $0.text = "사용자 정보 입력해주세요"
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private let detailLabel = UILabel().then {
        $0.text = "현 직장에 관하여 정보를 입력해주세요"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .color838383
    }
    
    private lazy var divisionButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 7
        stackView.distribution = .fillProportionally
        divisionButtons.forEach { button in
            stackView.addArrangedSubview(button)
        }
        
        return stackView
    }()
    
    private let divisionButtons: [UIButton] = [
        UIButton(type: .system).then {
            $0.setTitle("IT", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
        },
        UIButton(type: .system).then {
            $0.setTitle("교육", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
        },
        UIButton(type: .system).then {
            $0.setTitle("의료", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
        },
        UIButton(type: .system).then {
            $0.setTitle("서비스", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
        },
        UIButton(type: .system).then {
            $0.setTitle("제조 및 생산", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
        },
        UIButton(type: .system).then {
            $0.setTitle("금융", for: .normal)
            $0.imageView?.backgroundColor = .white
            $0.setImage(UIImage(), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
        }
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
        setupDivisionButtons()
    }
    
    private func addView() {
        [
            titleLabel,
            detailLabel,
            divisionButtonStackView
        ].forEach { view.addSubview($0) }
    }
    private var selectedDivisionButton: UIButton?

    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.leading.equalToSuperview().inset(24)
            $0.height.equalTo(29)
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(24)
            $0.height.equalTo(17)
        }
        
        divisionButtonStackView.snp.makeConstraints {
            $0.top.equalTo(detailLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(24)
        }
    }
    
    private func setupDivisionButtons() {
        divisionButtons.forEach { button in
            button.addTarget(self, action: #selector(divisionButtonTapped(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func divisionButtonTapped(_ button: UIButton) {
        selectedDivisionButton?.imageView?.backgroundColor = .white
        selectedDivisionButton?.imageView?.tintColor = .white
        if let selectedButton = selectedDivisionButton {
            selectedButton.isSelected = false
            selectedButton.backgroundColor = .systemGray6
        }
        
        button.isSelected = true
        button.backgroundColor = .systemGreen
//        button.titleLabel?.backgroundColor = .white
        button.imageView?.backgroundColor = .white
        selectedDivisionButton = button

    }
}
