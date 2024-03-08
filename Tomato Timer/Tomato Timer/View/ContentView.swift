//
//  ContentView.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 19.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var timerCount: CGFloat = 1200
    @State private var sessionCount: Int = 0
    @State private var currentMode: Mood = .code
    @State private var countdownTime: CGFloat = 1200
    @State private var defaultTime: CGFloat = 1200
    @State private var timerRunning: Bool = false
    @State private var isMinusButtonOnOff: Bool = true
    @State private var isPlusButtonOnOff: Bool = false
    
    var body: some View {
        Color(uiColor: Helper.Colors.background)
            .ignoresSafeArea()
            .onAppear {
                UIApplication.shared.isIdleTimerDisabled = true
            }
        
            .overlay {
                VStack(alignment: .center) {
                    ClockView(timerCount: $timerCount, sessionCount: $sessionCount, currentMood: $currentMode, countdownTime: $countdownTime, defaultTime: $defaultTime, timerRunning: $timerRunning, isMinusButtonOnOff: $isMinusButtonOnOff, isPlusButtonOnOff: $isPlusButtonOnOff)
                        .padding(.bottom, 50)
                    Spacer()
                    TimerView(timerCount: $timerCount, sessionCount: $sessionCount, currentMood: $currentMode, countdownTime: $countdownTime, defaultTime: $defaultTime, timerRunning: $timerRunning, isMinusButtonOnOff: $isMinusButtonOnOff, isPlusButtonOnOff: $isPlusButtonOnOff)
                        .padding(.bottom, 50)
                }
            }
    }
}

#Preview {
    ContentView()
}







