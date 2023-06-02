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
    
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                StartScreenView()
                
            }
            
            Text("Tap")
                .padding(.bottom, 100)
                .onAppear {
                    prepareHaptics()
                }
                .onTapGesture {
//                    triggerSelectionFeedback()
//                    count = 10
                     nomNomPattern()
                }
            
            Slider(value: $value, in: 0.1...1.0)
                .padding()
            
            
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
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        for val in stride(from: 0.1, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(val))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(val))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: val)
            events.append(event)
        }
        
        for val in stride(from: 0.1, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - val))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - val))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + val)
            events.append(event)
        }
        
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
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
    
    private func nomNomPattern()  {
        var events = [CHHapticEvent]()
        
      let rumble1 = CHHapticEvent(
        eventType: .hapticContinuous,
        parameters: [
            CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(value)),
          CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
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
