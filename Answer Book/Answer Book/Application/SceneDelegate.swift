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
    let notificationCenter = UNUserNotificationCenter.current()
        
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.mainViewController = MainViewController()
        window.rootViewController = mainViewController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        requestAuthorization()
        scheduleNotification()
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        mainViewController?.answerLabel.label.text = "8"
        mainViewController?.answerLabel.label.font = UIFont.systemFont(ofSize: MainViewController().dynamicFontSize(72))
    }
    
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert,.sound]) { granted, error in
            print("Permission granted \(granted)")
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        
        content.title = "New quote of the Day"
        content.sound = UNNotificationSound.default
        
        let identifier = "quote"
        
        var triggerDaily = DateComponents()
        triggerDaily.hour = 8
        triggerDaily.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request)
    }
    
    
}

