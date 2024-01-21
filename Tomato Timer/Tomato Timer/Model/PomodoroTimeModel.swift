//
//  PomodoroTimeModel.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 21.01.2024.
//

import Foundation

class PomodoroTimeModel: ObservableObject {
    @Published var pomodoroTimeInSeconds: CGFloat = 1200
    
    func addSeconds() {
        if pomodoroTimeInSeconds >= 3600 {
            pomodoroTimeInSeconds = 1200
        } else {
            pomodoroTimeInSeconds += 600
        }
    }
}
