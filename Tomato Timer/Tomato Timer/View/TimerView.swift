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
    
    @State private var defaultTime: CGFloat = 1200
    @State private var timerRunning = false
    @State private var countdownTime: CGFloat = 1200
    @State private var rotationAngleRepeatButton: Double = 0.0
    @State private var isMinusButtonOnOff: Bool = true
    @State private var isPlusButtonOnOff: Bool = false
    
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
                            .shadow(color: .black.opacity(0.5), radius: 5, x: 3, y: 3)
                        
                        //MARK: - Plus and Minus time
                        HStack(alignment: .center,spacing: 40) {
                            Button {
                                generateHapticFeedback(style: .rigid)
                                adjustTime(adding: false)
                                
                            } label: {
                                Image(systemName: "minus")
                                    .foregroundStyle(isMinusButtonOnOff ? Color(uiColor: Helper.Colors.comments) : Color(uiColor: Helper.Colors.number))
                                    .font(.largeTitle)
                            }
                            .disabled(isMinusButtonOnOff)
                            
                            
                            Text(String(format: "%02d:%02d", countdownMinutes, countdownSeconds))
                                .foregroundStyle(.white)
                                .font(.system(size: 36, weight: .regular, design: .monospaced))
                            
                            Button {
                                adjustTime(adding: true)
                                generateHapticFeedback(style: .rigid)
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundStyle(isPlusButtonOnOff ? Color(uiColor: Helper.Colors.comments) : Color(uiColor: Helper.Colors.number))
                                    .font(.largeTitle)
                            }
                            .disabled(isPlusButtonOnOff)
                            
                        }
                        
                        
                        
                        //MARK: - Play/stop and Restart time
                        VStack(alignment: .center) {
                            Button {
                                withAnimation(.spring(duration: 1, bounce: 0.6)) {
                                    rotationAnimation()
                                }
                                generateHapticFeedback(style: .light)
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
                                generateHapticFeedback(style: .soft)
                               
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
                        .onReceive(timer) { _ in
                            handleTimerUpdate()
                        }
                        
                    }
                    .frame(width: geometry.size.width , height: geometry.size.width - 50)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    
                }
                
            }
    }
    
    private func generateHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
    
    
    private func handleTimerUpdate() {
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
    
    private func rotationAnimation() {
        rotationAngleRepeatButton -= 180
    }
     

    
    private func adjustTime(adding: Bool) {
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

#Preview {
    TimerView(timerCount: .constant(1200))
}
