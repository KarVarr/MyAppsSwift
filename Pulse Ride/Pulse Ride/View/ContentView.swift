//
//  ContentView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 25.05.2023.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @StateObject private var massageVM = MassageViewModel.shared
    var imagesNameForButtons = ImagesNameForButtons()
    
    @State private var engine: CHHapticEngine?
    @State private var continuousPlayer: CHHapticAdvancedPatternPlayer?
    
    @State private var isPlaying = false
    
    @State private var buttonIsPressed = false
    @State private var buttonImageColor = 0.5
    @State private var shadowRadius = 15
    @State private var scale = 1.5
    
    let heightArrayForAnimation = [30,40,50,60,70,80]
    @State private var rectangleHeight = [40, 30, 50, 60, 80, 50, 40, 70, 50, 30, 60 ,80 ,40]
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        CustomNavBar()
                        Spacer(minLength: 50)
                        
                        VStack {
                            if isPlaying {
                                HStack {
                                    ForEach(0..<rectangleHeight.count, id: \.self) { index in
                                        CustomRectangleForAnimation(width: 15, height: CGFloat(rectangleHeight[index]), color: .white.opacity(0.8))
                                    }
                                }
                            } else {
                                VStackTitleAndSubtitle(title: Helpers.String.pressButtonTextTitle, subtitle: Helpers.String.pressButtonTextSubtitle)
                            }
                        }
                        .frame(height: 80)
                        
                        VStack {
                            GeometryReader { geo in
                                ZStack {
                                    Circle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(maxWidth: geo.size.width / 1.5, maxHeight: geo.size.width)
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
                                    toggleVibration()
                                }
                            }
                        }
                        
                        HStack(spacing: 30) {
                            ForEach(imagesNameForButtons.nameForImages, id: \.self) { image in
                                CustomButtonForIntensity(action: {
                                    massageVM.impactFeedback(.soft)
                                    switch image {
                                    case "snail":
                                        updateVibrationIntensity(0.6)
                                    case "tornado":
                                        updateVibrationIntensity(0.8)
                                    case "rocket":
                                        updateVibrationIntensity(1.0)
                                    default:
                                        break
                                    }
                                }, imageName: image)
                            }
                        }
                        Spacer(minLength: 30)
                    }
                }
                .onAppear {
                    setupHaptics()
                }
            }
        }
        .onReceive(timer) { _ in
            if isPlaying {
                for index in 0..<rectangleHeight.count {
                    DispatchQueue.main.asyncAfter(deadline: .now() - Double(index)) {
                        withAnimation {
                            rectangleHeight[index] = heightArrayForAnimation.randomElement() ?? 40
                        }
                    }
                }
            }
        }
    }
    
    private func setupHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    private func toggleVibration() {
        if isPlaying {
            stopVibration()
        } else {
            startVibration()
        }
        
        withAnimation {
            buttonImageColor = isPlaying ? 0.5 : 1
            shadowRadius = isPlaying ? 15 : 5
        }
        buttonIsPressed.toggle()
        isPlaying.toggle()
    }
    
    private func startVibration() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(massageVM.valueOfIntensity))
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
        
        let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: 100000)
        
        do {
            let pattern = try CHHapticPattern(events: [event], parameters: [])
            continuousPlayer = try engine?.makeAdvancedPlayer(with: pattern)
            try continuousPlayer?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    private func stopVibration() {
        do {
            try continuousPlayer?.stop(atTime: 0)
        } catch {
            print("Error stopping vibration: \(error.localizedDescription)")
        }
    }
    
    private func updateVibrationIntensity(_ newIntensity: Float) {
        guard isPlaying, let continuousPlayer = continuousPlayer else { return }
        
        do {
            let intensityParameter = CHHapticDynamicParameter(parameterID: .hapticIntensityControl,
                                                              value: newIntensity,
                                                              relativeTime: 0)
            try continuousPlayer.sendParameters([intensityParameter], atTime: 0)
        } catch {
            print("Error updating vibration intensity: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
