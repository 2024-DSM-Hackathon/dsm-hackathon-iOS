import UIKit

public extension UIViewController {
    private var isHiddenTabbar: Bool {
        self.tabBarController?.tabBar.alpha == 0
    }

    func showTabbar() {
        self.tabBarController?.tabBar.isHidden = false
        if isHiddenTabbar {
            UIView.tabbarAnimate { [weak self] in
                self?.tabBarController?.tabBar.alpha = 1
            }
        }
    }

    func hideTabbar() {
        if !isHiddenTabbar {
            self.tabBarController?.tabBar.isHidden = true
            UIView.tabbarAnimate { [weak self] in
                self?.tabBarController?.tabBar.alpha = 0
            }
        }
    }
}

public extension UIViewController {
    func setLargeTitle(title: String) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = title
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }

    func setSmallTitle(title: String) {
        self.navigationItem.title = title
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
}

private extension UIView {
    static func tabbarAnimate(
        animations: @escaping () -> Void,
        completion: ((Bool) -> Void)? = nil
    ) {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: .transitionCrossDissolve,
            animations: animations,
            completion: completion
        )
    }
}
