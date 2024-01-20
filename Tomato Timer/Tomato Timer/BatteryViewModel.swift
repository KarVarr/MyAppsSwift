//
//  BatteryViewModel.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 20.01.2024.
//

import SwiftUI

class BatteryViewModel: ObservableObject {
    @Published var batteryLevel: Int = 0
    @Published var batteryStateDescription: String = ""
    @Published var batteryStateColor: UIColor = Helper.Colors.type
    
    init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
        self.batteryLevel = Int(UIDevice.current.batteryLevel * 100)
        getBatteryState()
        
        NotificationCenter.default.addObserver(self, selector: #selector(batteryLevelDidChange(notification:)), name: UIDevice.batteryLevelDidChangeNotification, object: nil)
    }
    
    @objc func batteryLevelDidChange(notification: Notification) {
        self.batteryLevel = Int(UIDevice.current.batteryLevel * 100)
    }
    
    private func getBatteryState() {
        let batteryState = UIDevice.current.batteryState
        self.batteryStateDescription = getBatteryDescription(for: batteryState)
        self.batteryStateColor = getBatteryColor(for: batteryState)
    }
    
    private func getBatteryColor(for state: UIDevice.BatteryState) -> UIColor {
        switch state {
        case .unknown:
            return Helper.Colors.type
        case .unplugged:
            return Helper.Colors.type
        case .charging:
            return Helper.Colors.ifElseCondition
        case .full:
            return Helper.Colors.type
        @unknown default:
            return Helper.Colors.type
        }
    }
    
    private func getBatteryDescription(for state: UIDevice.BatteryState) -> String {
        switch state {
        case .unknown:
            return "Unknown"
        case .unplugged:
            return "On battery power"
        case .charging:
            return "Charging"
        case .full:
            return "Full"
        @unknown default:
            return "Unknown"
        }
    }
}
