import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

public final class QuestionTextView: UIView {
    private var disposeBag = DisposeBag()
    private var placeholderLabel = UILabel().then {
        $0.isHidden = false
        $0.textColor = UIColor.colorBDBDBF
    }
    public let textView = UITextView().then {
        $0.backgroundColor = .colorF4F4F4
        $0.layer.cornerRadius = 4
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.textContainerInset = .init(top: 12, left: 10, bottom: 12, right: 10)
    }

    public init() {
        super.init(frame: .zero)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func layoutSubviews() {
        addView()
        setLayout()
    }

    public func setTextField(
        placeholder: String
    ) {
        self.placeholderLabel.text = placeholder
        self.textView.rx.text.orEmpty.asObservable()
            .map { $0.isEmpty }
            .bind(onNext: { self.placeholderLabel.isHidden = !$0 })
            .disposed(by: disposeBag)
    }

    private func addView() {
        [
            textView
        ].forEach(self.addSubview(_:))

        textView.addSubview(placeholderLabel)
    }

    private func setLayout() {
        textView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(144)
            $0.bottom.equalToSuperview().inset(12)
        }

        placeholderLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(10)
        }
    }
}
