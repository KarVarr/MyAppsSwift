//
//  AppSound.swift
//  HayLingo
//
//  Created by Karen Vardanian on 06.01.2025.
//

import Foundation

// MARK: - Sound Settings
enum AppSound: String, CaseIterable {
    case on = "sound_on"
    case off = "sound_off"
    
    var localizedString: String {
        switch self {
        case .on:
            switch Locale.current.language.languageCode?.identifier {
            case "ru": return "Включено"
            case "hy": return "Միացված"
            default: return "On"
            }
        case .off:
            switch Locale.current.language.languageCode?.identifier {
            case "ru": return "Выключено"
            case "hy": return "Անջատված"
            default: return "Off"
            }
        }
    }
    
    static func fromLocalizedString(_ string: String) -> AppSound {
        switch string.lowercased() {
        case "включено", "միացված", "on":
            return .on
        case "выключено", "անջատված", "off":
            return .off
        default:
            return .on
        }
    }
}
