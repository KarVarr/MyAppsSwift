//
//  MassageViewModel.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 15.06.2023.
//

import SwiftUI
import CoreHaptics


class MassageViewModel: ObservableObject {
    static let shared = MassageViewModel()
    
    @Published var valueOfIntensity = 0.7
    private var engine: CHHapticEngine?
    let generator = UIImpactFeedbackGenerator(style: .heavy)
    private var isVibrating = false
    
    private init() {
        setupHapticEngine()
    }
    
    func impactFeedback(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impactGenerator = UIImpactFeedbackGenerator(style: style)
        impactGenerator.impactOccurred()
    }
    
    
    func toggleVibration() {
        isVibrating ? stopVibration() : startVibration()
    }
    
    func setupHapticEngine() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
        } catch {
            print("Error creating haptic engine: \(error.localizedDescription)")
            engine = nil
        }
    }
    
    func startVibration() {
        guard let engine = engine else { return }
        
        do {
            try engine.start()
            
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(valueOfIntensity))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
            let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: .infinity)
            
            let pattern = try CHHapticPattern(events: [event], parameters: [])
            
            let player = try engine.makePlayer(with: pattern)
            try player.start(atTime: 0)
            
            DispatchQueue.main.async {
                self.isVibrating = true
            }
            
        } catch {
            print("Error playing haptic pattern: \(error.localizedDescription)")
        }
    }
    
    
    private func stopVibration() {
        guard let engine = engine else { return }
        
        engine.stop(completionHandler: { error in
            if let error = error {
                print("Error stopping haptic engine: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    self.isVibrating = false
                }
            }
        })
    }
//    func stopVibration() {
//        generator.prepare() // Stops ongoing vibrations
//        DispatchQueue.main.async {
//            self.isVibrating = false
//        }
//    }
    
//    func startVibration() {
////        let generator = UIImpactFeedbackGenerator(style: .heavy)
//        generator.impactOccurred()
//        
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//            let intensity = Double(timer.timeInterval * 10).remainder(dividingBy: 2.0)
//            self.generator.prepare()
//            self.generator.impactOccurred(intensity: CGFloat(Float(intensity)))
//        }
//        DispatchQueue.main.async {
//            self.isVibrating = true
//        }
//        
//    }
        
   
}
