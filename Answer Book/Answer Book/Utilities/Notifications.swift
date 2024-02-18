//
//  Notifications.swift
//  Answer Book
//
//  Created by Karen Vardanian on 19.10.2023.
//

import UIKit
import UserNotifications

class Notifications: NSObject, UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()
    
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
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request)
    }
}
