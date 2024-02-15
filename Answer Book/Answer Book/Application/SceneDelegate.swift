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
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        notifications.scheduleNotification()
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        mainViewController?.fetchQuotes()
        mainViewController?.timer = Timer(timeInterval: 1, target: self, selector: #selector(mainViewController?.updateDataForQuotes), userInfo: nil, repeats: true)
        print("refresh fetchQoutes and timer is on")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        mainViewController?.answerLabel.label.text = "8"
        mainViewController?.answerLabel.label.font = UIFont.systemFont(ofSize: MainViewController().dynamicFontSize(72))
        mainViewController?.timer?.invalidate()
        print("timer is off")
    }
}

