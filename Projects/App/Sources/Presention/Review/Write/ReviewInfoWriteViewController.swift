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

    }
}
