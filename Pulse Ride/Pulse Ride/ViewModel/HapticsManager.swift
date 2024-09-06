//
//  HapticsManager.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 04.09.2024.
//

import SwiftUI
import CoreHaptics

extension ContentView {
    func setupHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func toggleVibration() {
        if isPlaying {
            stopVibration()
        } else {
            startVibration()
        }
        
        withAnimation {
            buttonImageColor = isPlaying ? 0.5 : 1
            shadowRadius = isPlaying ? 15 : 5
        }
        isButtonPressed.toggle()
        isPlaying.toggle()
    }
    
    func startVibration() {
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
    
    func stopVibration() {
        do {
            try continuousPlayer?.stop(atTime: 0)
        } catch {
            print("Error stopping vibration: \(error.localizedDescription)")
        }
    }
    
    func updateVibrationIntensity(_ newIntensity: Float) {
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
