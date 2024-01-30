//
//  TimerView + Ext.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 30.01.2024.
//

import Foundation
import SwiftUI

extension TimerView {
    func generateHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
    
    func handleTimerUpdate() {
        DispatchQueue.main.async {
            guard timerRunning else { return }
            if countdownTime > 0 {
                countdownTime -= 1
            } else {
                audioViewModel.playSound()
                sleep(2)
                timerRunning = false
                countdownTime = defaultTime
                timerCount = countdownTime
            }
        }
    }
    
    func rotationAnimation() {
        rotationAngleRepeatButton -= 180
    }
     
    func adjustTime(adding: Bool) {
        timerRunning = false
        countdownTime = defaultTime

        if adding {
            if defaultTime >= 3600 {
                isPlusButtonOnOff = true
                isMinusButtonOnOff = false
                defaultTime = 3600
                countdownTime = 3600
                timerCount = countdownTime
            } else {
                isMinusButtonOnOff = false
                isPlusButtonOnOff = defaultTime + 300 >= 3600
                defaultTime += 300
                countdownTime += 300
                timerCount = countdownTime
            }
        } else {
            if defaultTime <= 1200 {
                isMinusButtonOnOff = true
                isPlusButtonOnOff = false
                defaultTime = 1200
                countdownTime = 1200
                timerCount = countdownTime
            } else {
                isPlusButtonOnOff = false
                isMinusButtonOnOff = defaultTime - 300 <= 1200
                defaultTime -= 300
                countdownTime -= 300
                timerCount = countdownTime
            }
        }
    }
}
