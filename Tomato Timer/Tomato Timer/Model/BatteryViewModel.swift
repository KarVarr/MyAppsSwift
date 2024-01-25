//
//  BatteryViewModel.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 20.01.2024.
//

import SwiftUI

class BatteryViewModel: ObservableObject {
   @Published var batteryLevel: Int = 0

   init() {
      UIDevice.current.isBatteryMonitoringEnabled = true
      self.batteryLevel = Int(UIDevice.current.batteryLevel * 100)

      // Update battery level every 1 second
      let notificationCenter = NotificationCenter.default
      notificationCenter.addObserver(
         self,
         selector: #selector(batteryLevelDidChange(notification:)),
         name: UIDevice.batteryLevelDidChangeNotification,
         object: nil
      )
      notificationCenter.post(
         Notification(name: UIDevice.batteryLevelDidChangeNotification)
      )
   }

   @objc func batteryLevelDidChange(notification: Notification) {
      self.batteryLevel = Int(UIDevice.current.batteryLevel * 100)
   }
}

