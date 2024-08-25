//
//  SceneDelegate.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    let audioPlayer = AudioPlayerForSound()
    var window: UIWindow?
    var mainViewController: MainViewController?
    var toolbar: ToolbarView?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = MainViewController()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .dark
        self.window = window
        mainViewController = viewController
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {

    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
     
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
      
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
    
    
}

