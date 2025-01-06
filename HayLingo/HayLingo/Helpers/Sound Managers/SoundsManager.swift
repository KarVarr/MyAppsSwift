//
//  SoundsManager.swift
//  HayLingo
//
//  Created by Karen Vardanian on 06.01.2025.
//

import Foundation
import SwiftUI

class SoundsManager: ObservableObject {
    @AppStorage("selectedSound") private var storedSound: String = AppSound.on.rawValue
    
    var currentSound: AppSound {
        AppSound(rawValue: storedSound) ?? .on
    }
    
    func updateSound(_ sound: AppSound) {
        storedSound = sound.rawValue
    }
    
    func updateSoundFromLocalizedString(_ localizedString: String) {
        let sound = AppSound.fromLocalizedString(localizedString)
        storedSound = sound.rawValue
    }
    
    func colorScheme() -> String {
        switch currentSound {
        case .on:
            return "sound_on"
        case .off:
            return "sound_off"
        }
    }
}
