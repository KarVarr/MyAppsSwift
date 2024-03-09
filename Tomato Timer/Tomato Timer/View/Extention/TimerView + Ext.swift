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
                if currentMood == .code {
                    sessionCount += 1
                }
            }
        }
    }
    
    func rotationAnimation() {
        rotationAngleRepeatButton -= 180
    }
    
    func timerPlusMinus(state: Bool, max: CGFloat, min: CGFloat) {
        if state {
            if defaultTime >= max {
                isPlusButtonOnOff = true
                isMinusButtonOnOff = false
                defaultTime = max
                countdownTime = max
                timerCount = countdownTime
            } else {
                isMinusButtonOnOff = false
                isPlusButtonOnOff = defaultTime + 300 >= max
                defaultTime += 300
                countdownTime += 300
                timerCount = countdownTime
            }
        } else {
            if defaultTime <= min {
                isMinusButtonOnOff = true
                isPlusButtonOnOff = false
                defaultTime = min
                countdownTime = min
                timerCount = countdownTime
            } else {
                isPlusButtonOnOff = false
                isMinusButtonOnOff = defaultTime - 300 <= min
                defaultTime -= 300
                countdownTime -= 300
                timerCount = countdownTime
            }
        }
    }
    
    func adjustTime(adding: Bool) {
        timerRunning = false
        countdownTime = defaultTime
        if currentMood == .code {
            timerPlusMinus(state: adding, max: 3600, min: 1200)
        } else {
            timerPlusMinus(state: adding, max: 900, min: 300)
        }
    }
}
