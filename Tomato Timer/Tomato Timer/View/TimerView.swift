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
    
    @State var defaultTime: CGFloat = 1200
    @State var timerRunning = false
    @State var countdownTime: CGFloat = 1200
    @State var rotationAngleRepeatButton: Double = 0.0
    @State var isMinusButtonOnOff: Bool = true
    @State var isPlusButtonOnOff: Bool = false
    
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
            return Helper.Colors.linearGradientPinkBlue
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
    TimerView(timerCount: .constant(1200), sessionCount: .constant(0))
}
