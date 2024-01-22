//
//  TimerView.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 19.01.2024.
//

import SwiftUI


struct TimerView: View {
    @Binding var timerCount: CGFloat
    
    @State private var defaultTime: CGFloat = 1200
    @State private var timerRunning = false
    @State private var countdownTime: CGFloat = 1200
    @State private var rotationAngleRepeatButton: Double = 0.0
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var strokeStyle: StrokeStyle {
        StrokeStyle(lineWidth: 15, lineCap: .round)
    }
    
    var buttonIcon: String {
        timerRunning ? "pause" : "play"
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
                
                GeometryReader { geometry in
                    ZStack(alignment: .center) {
                        Circle()
                            .stroke(Color.gray.opacity(0.2), style: strokeStyle)
                        
                        Circle()
                            .trim(from: 0, to: 1 - ((defaultTime - countdownTime) / defaultTime))
                            .stroke(countdownColor, style: strokeStyle)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeIn, value: countdownTime)
                        
                        //MARK: - Plus and Minus time
                        HStack(spacing: 25) {
                            Button {
                                adjustTime(adding: false)
                            } label: {
                                Image(systemName: "minus")
                                    .foregroundStyle(Color(uiColor: Helper.Colors.type))
                                    .font(.largeTitle)
                            }
                            
                            Text(String(format: "%02d:%02d", countdownMinutes, countdownSeconds))
                                .foregroundStyle(Color(uiColor: Helper.Colors.brackets)).font(.largeTitle.monospacedDigit())
                            
                            Button {
                                adjustTime(adding: true)
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundStyle(Color(uiColor: Helper.Colors.type))
                                    .font(.largeTitle)
                            }
                            
                        }
                        
                        //MARK: - Play/stop and Restart time
                        VStack(alignment: .center) {
                            Button {
                                withAnimation(.spring(duration: 1, bounce: 0.6)) {
                                    rotationAnimation()
                                }
                                timerRunning = false
                                countdownTime = defaultTime
                            } label: {
                                Image("repeat")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .frame(width: 50)
                            }
                            .foregroundStyle(Color(uiColor: Helper.Colors.comments)).font(.largeTitle)
                            .rotation3DEffect(
                                .degrees(rotationAngleRepeatButton),
                                axis: (x: 0.0, y: 0.0, z: -1.0)
                            )
                            
                            Spacer()
                            
                            Button {
                                withAnimation(.easeInOut) {
                                    timerRunning.toggle()
                                }
                            } label: {
                                Image(buttonIcon)
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .frame(width: 50)
                            }
                            .foregroundStyle(Color(uiColor: Helper.Colors.variable)).font(.largeTitle)
                     
                        }
                        .padding(.vertical, 40)
                    }
                    .frame(width: geometry.size.width - 90, height: geometry.size.width - 90)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    .onReceive(timer, perform: { _ in
                        guard timerRunning else { return }
                        if countdownTime > 0 {
                            countdownTime -= 1
                        } else {
                            timerRunning = false
                            countdownTime = defaultTime
                            timerCount = countdownTime
                        }
                    })
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
                defaultTime = 3600
                countdownTime = 3600
                timerCount = countdownTime
            } else {
                defaultTime += 300
                countdownTime += 300
                timerCount = countdownTime
            }
        } else {
            if defaultTime <= 1200 {
                defaultTime = 1200
                countdownTime = 1200
                timerCount = countdownTime
            } else {
                defaultTime -= 300
                countdownTime -= 300
                timerCount = countdownTime
            }
        }
    }
    
}

#Preview {
    TimerView(timerCount: .constant(1200))
}
