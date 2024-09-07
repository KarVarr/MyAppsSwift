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
    
    @Published var valueOfIntensity = 0.75
    let generator = UIImpactFeedbackGenerator(style: .heavy)
    
    @Published var isVibrating = false
    private var engine: CHHapticEngine?
    private var player: CHHapticAdvancedPatternPlayer?
    
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
            engine?.stoppedHandler = { reason in
                print("The engine stopped: \(reason)")
                DispatchQueue.main.async {
                    self.isVibrating = false
                }
            }
            engine?.resetHandler = {
                print("The engine reset")
                do {
                    try self.engine?.start()
                } catch {
                    print("Failed to restart the engine: \(error)")
                }
            }
        } catch {
            print("Error creating haptic engine: \(error.localizedDescription)")
            engine = nil
        }
    }
    
    func startVibration() {
        guard let engine = engine, CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            print("This device does not support haptics")
            return
        }
        
        do {
            try engine.start()
            
            let intensityParameter = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(valueOfIntensity))
            let sharpnessParameter = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
            
            let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensityParameter, sharpnessParameter], relativeTime: 0, duration: 100000)
            
            let pattern = try CHHapticPattern(events: [event], parameters: [])
            player = try engine.makeAdvancedPlayer(with: pattern)
            player?.loopEnabled = true
            
            try player?.start(atTime: CHHapticTimeImmediate)
            isVibrating = true
        } catch {
            print("Error starting haptics: \(error.localizedDescription)")
        }
    }

    
//    func startVibration() {
//        guard let engine = engine, CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
//            print("This device does not support haptics")
//            return
//        }
//        
//        do {
//            try engine.start()
//            
//            let intensityCurve = CHHapticParameterCurve(
//                parameterID: .hapticIntensityControl,
//                controlPoints: [
//                    CHHapticParameterCurve.ControlPoint(relativeTime: 0, value: 1),
//                    CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: 0.5),
//                    CHHapticParameterCurve.ControlPoint(relativeTime: 1, value: 1)
//                ],
//                relativeTime: 0
//            )
//            
//            let event1 = CHHapticEvent(eventType: .hapticContinuous, parameters: [], relativeTime: 0, duration: 0.5)
//            let event2 = CHHapticEvent(eventType: .hapticContinuous, parameters: [], relativeTime: 0.5, duration: 0.5)
//            
//            let pattern = try CHHapticPattern(events: [event1, event2], parameterCurves: [intensityCurve])
//            
//            player = try engine.makeAdvancedPlayer(with: pattern)
//            player?.loopEnabled = true
//            
//            try player?.start(atTime: CHHapticTimeImmediate)
//            isVibrating = true
//        } catch {
//            print("Error starting haptics: \(error.localizedDescription)")
//        }
//    }
    
    func stopVibration() {
        guard let player = player else { return }
        
        do {
            try player.stop(atTime: CHHapticTimeImmediate)
            isVibrating = false
        } catch {
            print("Error stopping haptics: \(error.localizedDescription)")
        }
    }
    
    func updateVibrationIntensity(_ intensity: Float) {
        guard let player = player else { return }
        valueOfIntensity = Double(intensity)
        do {
            let dynamicParameter = CHHapticDynamicParameter(parameterID: .hapticIntensityControl, value: intensity, relativeTime: 0)
            try player.sendParameters([dynamicParameter], atTime: CHHapticTimeImmediate)
        } catch {
            print("Error updating intensity: \(error)")
        }
    }
    
    func handleScenePhaseChange(_ newPhase: ScenePhase) {
        switch newPhase {
        case .background:
            stopVibration()
        case .active:
            if isVibrating {
                startVibration()
            }
        default:
            break
        }
    }
}
