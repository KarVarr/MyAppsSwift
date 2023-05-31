//
//  HapticsTouchGenerator.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 31.05.2023.
//

import CoreHaptics
import SwiftUI

struct HapticsTouchGenerator {
    
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func prepareHaptics(_ engine: CHHapticEngine?) {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    
}
