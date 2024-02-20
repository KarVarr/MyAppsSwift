//
//  SceneDelegate.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit
import NotificationCenter

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var mainViewController: MainViewController?
    var notifications = Notifications()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.mainViewController = MainViewController()
        window.rootViewController = mainViewController
        window.makeKeyAndVisible()
        self.window = window
        
        notifications.requestAuthorization()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {

    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        mainViewController?.fetchQuotes()
        mainViewController?.timer = Timer(timeInterval: 1, target: self, selector: #selector(mainViewController?.updateDataForQuotes), userInfo: nil, repeats: true)
        print("refresh fetch Quotes and timer is on")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        mainViewController?.answerLabel.label.text = "8"
        mainViewController?.answerLabel.label.font = UIFont.systemFont(ofSize: MainViewController().dynamicFontSize(72))
        mainViewController?.timer?.invalidate()
        print("timer is off")
    }
}

