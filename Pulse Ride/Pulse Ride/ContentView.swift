//
//  ContentView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 25.05.2023.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @State private var engine: CHHapticEngine?
    @State private var isPlaying = false
    @State private var count = 10
    @State private var value = 0.5
    var power = [0.2, 0.5, 0.8]
    @State private var sharpness = 0.5
    
    var body: some View {
        NavigationView {
            
            VStack {
                GeometryReader { geo in
                    ZStack {
                        
                        LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
                        
                        StartScreenView(engine: $engine, startButtonAction: nomNomPattern)
                        
                        Slider(value: $value, in: 0.1...1.0)
                            .padding()
                            .position(x: geo.size.width / 2, y: geo.size.height - 150)
                        
                        
                    }
                    .onAppear {
                        prepareHaptics()
                    }
                    
                }
            }
            .navigationTitle("Pulse Ride")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                    }

                }
            }
        }
        
        
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    
    func selectionFeedback() {
        let feedbackGenerator = UISelectionFeedbackGenerator()
        feedbackGenerator.selectionChanged()
    }
    
    func impactFeedback() {
        let impactGenerator = UIImpactFeedbackGenerator(style: .heavy)
        impactGenerator.impactOccurred()
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    
    func triggerSelectionFeedback() {
        guard count > 0 else {
            return
        }
        
        impactFeedback()
        simpleSuccess()
        selectionFeedback()
        
        count -= 1
        
        if count > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                triggerSelectionFeedback()
            }
        }
    }
    
    func nomNomPattern()  {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        let rumble1 = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(value)),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(value))
            ],
            relativeTime: 0,
            duration: 1.5)
        events.append(rumble1)
        
        let rumble2 = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.4),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
            ],
            relativeTime: 1.5,
            duration: 0.5)
        events.append(rumble2)
        
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
