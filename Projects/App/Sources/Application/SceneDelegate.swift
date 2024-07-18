import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene, willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            let rootViewController = LoginViewController(LoginViewModel())
            //        let rootViewController = MainViewController(MainViewModel())
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = UINavigationController(rootViewController: rootViewController)
            UINavigationBar.appearance().tintColor = .black
            
            window?.makeKeyAndVisible()
        }
    
    func sceneDidDisconnect(_ scene: UIScene) { }
    
    func sceneDidBecomeActive(_ scene: UIScene) { }
    
    func sceneWillResignActive(_ scene: UIScene) { }
    
    func sceneWillEnterForeground(_ scene: UIScene) { }
    
    func sceneDidEnterBackground(_ scene: UIScene) { }
    
    
}
