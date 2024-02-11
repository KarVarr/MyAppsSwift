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
    
    var body: some View {
        Color(uiColor: Helper.Colors.background)
            .ignoresSafeArea()
            .onAppear {
                UIApplication.shared.isIdleTimerDisabled = true
            }
        
            .overlay {
                VStack(alignment: .center) {
                    ClockView(timerCount: $timerCount, sessionCount: $sessionCount)
                        .padding(.bottom, 50)
                    Spacer()
                    TimerView(timerCount: $timerCount, sessionCount: $sessionCount)
                        .padding(.bottom, 50)
                }
            }
    }
}

#Preview {
    ContentView()
}







