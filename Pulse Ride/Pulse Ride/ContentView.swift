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
                    if !isPlaying {
                        startLoop()
                    } else {
                        stopLoop()
                    }

                }
        
        }
        
        
        
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
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

        for val in stride(from: 0.5, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(val))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(val))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: val)
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
    
    func startLoop() {
        isPlaying = true
        DispatchQueue.global(qos: .background).async {
            while self.isPlaying {
                self.complexSuccess()
                Thread.sleep(forTimeInterval: 1)
            }
        }
    }
    
    func stopLoop() {
        isPlaying = false
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
