//
//  TimerViewBody + Ext.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 05.03.2024.
//

import SwiftUI

extension TimerView {
    var body: some View {
        Color(uiColor: Helper.Colors.background)
            .ignoresSafeArea()
            .overlay {
                GeometryReader { geometry in
                    ZStack(alignment: .center) {
                        Circle()
                            .stroke(Color.gray.opacity(0.2), style: strokeStyle)
                        Circle()
                            .trim(from: 0, to: 1 - (defaultTime - countdownTime) / defaultTime)
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
                                .foregroundStyle(Helper.Colors.linearGradientDarkPinkPurple)
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
                                sessionCount = 0
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
    
//    private func calculateTrim() -> CGFloat {
//           let progress: CGFloat
//           if countdownTime <= 300 {
//               progress = 1 - (300 - countdownTime) / 300
//           } else {
//               progress = 1 - (defaultTime - countdownTime) / defaultTime
//           }
//           return progress
//       }
}
