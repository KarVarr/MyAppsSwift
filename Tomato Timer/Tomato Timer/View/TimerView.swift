//
//  TimerView.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 19.01.2024.
//

import SwiftUI
import Foundation


struct TimerView: View {
    let defaultTime: CGFloat = 1500
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var timerRunning = false
    @State private var countdownTime: CGFloat = 1500
    
    var strokeStyle: StrokeStyle {
        StrokeStyle(lineWidth: 15, lineCap: .round)
    }
    
    var buttonIcon: String {
        timerRunning ? "pause.circle.fill" : "play.circle.fill"
    }
    
    var countdownColor: Color {
        switch countdownTime {
        case 300...: return Color(uiColor: Helper.Colors.ifElseCondition)
        case 60...: return Color(uiColor: Helper.Colors.number)
        default: return Color(uiColor: Helper.Colors.string)
        }
    }
    
    
    
    
    var body: some View {
        Color(uiColor: Helper.Colors.background)
            .ignoresSafeArea()
            .overlay {
              
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.2), style: strokeStyle)
                        
                        Circle()
                            .trim(from: 0, to: 1 - ((defaultTime - countdownTime) / defaultTime))
                            .stroke(countdownColor, style: strokeStyle)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeIn, value: countdownTime)
                        
                        HStack(spacing: 25) {
                            Label("", systemImage: buttonIcon)
                                .foregroundStyle(Color(uiColor: Helper.Colors.variable)).font(.largeTitle)
                                .onTapGesture(perform: {
                                    timerRunning.toggle()
                                })
                            Text("\(Int(countdownTime))")
                                .foregroundStyle(Color(uiColor: Helper.Colors.brackets)) .font(.largeTitle)
                            Label("", systemImage: "gobackward")
                                .foregroundStyle(Color(uiColor: Helper.Colors.string)).font(.largeTitle)
                                .onTapGesture(perform: {
                                    timerRunning = false
                                    countdownTime = defaultTime
                                })
                        }
                    }
                    .frame(width: 300, height: 300)
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

#Preview {
    TimerView()
}
