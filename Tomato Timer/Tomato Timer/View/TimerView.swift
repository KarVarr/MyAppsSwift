//
//  TimerView.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 19.01.2024.
//

import SwiftUI


struct TimerView: View {
    @State private var defaultTime: CGFloat = 1200
    
    @State private var timerRunning = false
    @State private var countdownTime: CGFloat = 1200
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
    
    var countdownMinutes: Int {
        return Int(countdownTime / 60)
    }
    
    var countdownSeconds: Int {
        return Int(countdownTime) % 60
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
                        Button {
                            minusTime()
                        } label: {
                            Image(systemName: "minus")
                                .foregroundStyle(Color(uiColor: Helper.Colors.type))
                                .font(.largeTitle)
                        }
                        
                        Text(String(format: "%02d:%02d", countdownMinutes, countdownSeconds))
                            .foregroundStyle(Color(uiColor: Helper.Colors.brackets)).font(.largeTitle.monospacedDigit())
                        
                        Button {
                            addTime()
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(Color(uiColor: Helper.Colors.type))
                                .font(.largeTitle)
                        }
                        
                    }
                    VStack {
                        Button(action: {}, label: {
                            Label("", systemImage: "gobackward")
                                .foregroundStyle(Color(uiColor: Helper.Colors.comments)).font(.largeTitle)
                                .onTapGesture(perform: {
                                    timerRunning = false
                                    countdownTime = defaultTime
                                })
                        })
                        
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Label("", systemImage: buttonIcon)
                                .foregroundStyle(Color(uiColor: Helper.Colors.variable)).font(.largeTitle)
                                .onTapGesture(perform: {
                                    timerRunning.toggle()
                                })
                        })
                        
                    }
                    .frame(height: 200)
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
    
    func addTime() {
        timerRunning = false
        countdownTime = defaultTime
        if defaultTime >= 3600 {
            defaultTime = 1200
            countdownTime = 1200
        } else {
            defaultTime += 300
            countdownTime += 300
        }
    }
    
    func minusTime() {
        timerRunning = false
        countdownTime = defaultTime
        if defaultTime <= 1200 {
            defaultTime = 1200
            countdownTime = 1200
        } else {
            defaultTime -= 300
            countdownTime -= 300
        }
    }
}

#Preview {
    TimerView()
}
