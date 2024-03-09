//
//  TimerView.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 19.01.2024.
//

import SwiftUI


struct TimerView: View {
    let audioViewModel = AudioViewModel()
    
    @Binding var timerCount: CGFloat
    @Binding var sessionCount: Int
    @Binding var currentMood: Mood
    @Binding var countdownTime: CGFloat
    @Binding var defaultTime: CGFloat
    @Binding var timerRunning: Bool
    @Binding var isMinusButtonOnOff: Bool
    @Binding var isPlusButtonOnOff: Bool
    
    @State var rotationAngleRepeatButton: Double = 0.0
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var strokeStyle: StrokeStyle {
        StrokeStyle(lineWidth: 5, lineCap: .round)
    }
    
    var buttonIcon: String {
        timerRunning ? "pause" : "play"
    }
    
    var countdownColor: LinearGradient {
        switch countdownTime {
        case 300...:
            return Helper.Colors.linearGradientBlue
        case 60...:
            return Helper.Colors.linearGradientRedOrange
        default:
            return Helper.Colors.linearGradientDarkGrayBrightRed
        }
    }
    
    var countdownMinutes: Int {
        return Int(countdownTime / 60)
    }
    
    var countdownSeconds: Int {
        return Int(countdownTime) % 60
    }
    
    //body in extension TimerViewBody + Ext
}

#Preview {
    TimerView(timerCount: .constant(1200), sessionCount: .constant(0), currentMood: .constant(.code), countdownTime: .constant(1200), defaultTime: .constant(1200), timerRunning: .constant(false), isMinusButtonOnOff: .constant(true), isPlusButtonOnOff: .constant(false))
}
