import UIKit

public class BaseTableViewCell<Model>: UITableViewCell {
    public var model: Model?

    public override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        addView()
        setLayout()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func addView() {}

    public func setLayout() {}

    public func configureView() {}

    public func adapt(model: Model) {
        self.model = model
    }
}
