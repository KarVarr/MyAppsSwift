//
//  VibrationEngine.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 26.02.2024.
//

import SwiftUI
import CoreHaptics

struct bbbContentView: View {
    @State private var engine: CHHapticEngine?
    @State private var player: CHHapticAdvancedPatternPlayer?
    @State private var isVibrating = false
    
    @State private var isPlaying = false
    @State private var buttonIsPressed = false
    @State private var buttonImageColor = 0.5
    @State private var shadowRadius = 15
    @State private var scale = 1.5
    
    var body: some View {
        VStack{
            GeometryReader { geo in
                ZStack{
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                        .frame(maxWidth: geo.size.width / 1.5, maxHeight: geo.size.width )
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                        .shadow(radius: CGFloat(shadowRadius), x: CGFloat(shadowRadius), y: CGFloat(shadowRadius))
                    
                    
                    Image(systemName: "power")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white.opacity(buttonImageColor))
                        .frame(width: geo.size.width / 4, height: geo.size.height / 3)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                        .scaleEffect(scale)
                        .animation(.easeIn(duration: 1), value: scale)
                }
                .onTapGesture {
                    startButton()
                    self.isVibrating.toggle()
                    self.toggleVibration()
                }
                
            }
            
        }
        
        
        
//        Button(action: {
//            // Переключаем состояние вибрации
//            self.isVibrating.toggle()
//            
//            // Вызываем функцию для управления вибрацией
//            self.toggleVibration()
//        }) {
//            Text(isVibrating ? "Stop Vibration" : "Start Vibration")
//        }
    }
    
    // Функция для управления вибрацией
    private func toggleVibration() {
        if self.isVibrating {
            startVibration()
        } else {
            stopVibration()
        }
    }
    
    // Функция для запуска вибрации
    private func startVibration() {
        do {
            // Создаем экземпляр CHHapticEngine, если еще не создан
            if engine == nil {
                engine = try CHHapticEngine()
                try engine?.start()
            }
            
            // Создаем кривую для управления интенсивностью
            let intensityCurve = CHHapticParameterCurve(
                parameterID: .hapticIntensityControl,
                controlPoints: [
                    // Начинаем с высокой интенсивности (значение 1) в начале
                    CHHapticParameterCurve.ControlPoint(relativeTime: 0, value: 0.9),
                    // Уменьшаем интенсивность к концу периода пульсации (значение 0.5, например)
                    CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: 0.5),
                    // Увеличиваем интенсивность к началу следующего периода пульсации (значение 1)
                    CHHapticParameterCurve.ControlPoint(relativeTime: 0.9, value: 0.9)
                ],
                relativeTime: 0
            )

            // Создаем события для пульсирующей вибрации
            let event1 = CHHapticEvent(eventType: .hapticContinuous, parameters: [], relativeTime: 0, duration: 0.5)
            let event2 = CHHapticEvent(eventType: .hapticContinuous, parameters: [], relativeTime: 0.5, duration: 0.5)

            // Создаем шаблон из событий и кривой интенсивности
            let pattern = try CHHapticPattern(events: [event1, event2], parameterCurves: [intensityCurve])

            // Создаем проигрыватель из шаблона
            self.player = try engine?.makeAdvancedPlayer(with: pattern)

            // Запускаем проигрыватель
            if let player = self.player {
                try player.start(atTime: CHHapticTimeImmediate)
                player.loopEnabled = true
            } else {
                print("Error: player is nil or not of type CHHapticAdvancedPatternPlayer")
            }
        } catch {
            print("Error starting haptics: \(error.localizedDescription)")
        }
    }
    
    // Функция для остановки вибрации
    private func stopVibration() {
        do {
            // Если есть проигрыватель, останавливаем его
            if let player = self.player {
                try player.stop(atTime: CHHapticTimeImmediate)
            }
        } catch {
            print("Error stopping haptics: \(error.localizedDescription)")
        }
    }
    
    func startButton() {
        if !buttonIsPressed {
            withAnimation {
                buttonImageColor = 1
                shadowRadius = 5
            }
            buttonIsPressed = true
            isPlaying = true
        } else {
            withAnimation {
                buttonImageColor = 0.5
                shadowRadius = 15
            }
            buttonIsPressed = false
            isPlaying = false
        }
    }
    
}


#Preview {
    ContentView()
}
