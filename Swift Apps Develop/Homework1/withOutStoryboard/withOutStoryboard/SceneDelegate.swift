//
//  SceneDelegate.swift
//  withOutStoryboard
//
//  Created by Valia Smolin on 25.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        let window = UIWindow(windowScene: windowScene)
        let viewController = ViewController()
        _ = UINavigationController(rootViewController: ViewController())
        window.rootViewController = viewController
        self.window = window
        
        window.makeKeyAndVisible()
        
    }
}



