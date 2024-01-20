//
//  TimerView.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 19.01.2024.
//

import SwiftUI
import Foundation


struct TimerView: View {
    let defaultTime: CGFloat = 25
    
    
    @State private var timerRunning = false
    @State private var countdownTime: CGFloat = 25
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var strokeStyle: StrokeStyle {
        StrokeStyle(lineWidth: 15, lineCap: .round)
    }
    
    var buttonIcon: String {
        timerRunning ? "pause.rectangle.fill" : "play.rectangle.fill"
    }
    
    var countdownColor: Color {
        switch countdownTime {
        case 6...: return Color.green
        case 3...: return Color.yellow
        default: return Color.red
        }
    }
    
    
    
    
    var body: some View {
        Color(uiColor: Helper.Colors.background)
            .ignoresSafeArea()
            .overlay {
                VStack {
                    ClockView()
                    
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.2), style: strokeStyle)
                        
                        Circle()
                            .trim(from: 0, to: 1 - ((defaultTime - countdownTime) / defaultTime))
                            .stroke(countdownColor, style: strokeStyle)
                            .rotationEffect(.degrees(-90))
                            .animation(.spring(duration: 1, bounce: 0.4), value: countdownTime)
                        
                        HStack(spacing: 25) {
                            Label("", systemImage: buttonIcon)
                                .foregroundStyle(.black).font(.title)
                                .onTapGesture(perform: {
                                    timerRunning.toggle()
                                })
                            Text("\(Int(countdownTime))")
                                .font(.largeTitle)
                            Label("", systemImage: "gobackward")
                                .foregroundStyle(.red)
                                .onTapGesture(perform: {
                                    timerRunning = false
                                    countdownTime = defaultTime
                                })
                        }
                    }
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 100)
                    .onReceive(timer, perform: { _ in
                        guard timerRunning else { return }
                        if countdownTime > 0 {
                            countdownTime -= 1
                        } else {
                            timerRunning = false
                            countdownTime = defaultTime
                        }
                    })
                    
                    
                }
                
                
            }
    }
}

#Preview {
    TimerView()
}
