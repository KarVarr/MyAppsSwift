//
//  ThemeManager.swift
//  HayLingo
//
//  Created by Karen Vardanian on 08.12.2024.
//

import Foundation
import SwiftUI

// MARK: - Language Settings
enum AppLanguage: String, CaseIterable {
    case russian = "language_russian"
    case english = "language_english"
    
    var localizedString: String {
        switch self {
        case .russian:
            switch Locale.current.language.languageCode?.identifier {
            case "ru": return "Русский"
            case "hy": return "Ռուսերեն"
            default: return "Russian"
            }
        case .english:
            switch Locale.current.language.languageCode?.identifier {
            case "ru": return "Английский"
            case "hy": return "Անգլերեն"
            default: return "English"
            }
        }
    }
    
    static func fromLocalizedString(_ string: String) -> AppLanguage {
        switch string.lowercased() {
        case "русский", "ռուսերեն", "russian":
            return .russian
        case "английский", "անգլերեն", "english":
            return .english
        default:
            return .russian
        }
    }
}


// MARK: - Theme Settings
enum AppTheme: String, CaseIterable {
    case light = "theme_light"
    case dark = "theme_dark"
    case system = "theme_system"
    
    var localizedString: String {
        switch self {
        case .light:
            switch Locale.current.language.languageCode?.identifier {
            case "ru":
                return "Светлая"
            case "hy":
                return "Լուսավոր"
            default:
                return "Light"
            }
        case .dark:
            switch Locale.current.language.languageCode?.identifier {
            case "ru":
                return "Темная"
            case "hy":
                return "Մուգ"
            default:
                return "Dark"
            }
        case .system:
            switch Locale.current.language.languageCode?.identifier {
            case "ru":
                return "Системная"
            case "hy":
                return "Համակարգ"
            default:
                return "System"
            }
        }
    }
    
    static func fromLocalizedString(_ string: String) -> AppTheme {
        for theme in AppTheme.allCases {
            if theme.localizedString == string {
                return theme
            }
        }
        return .system 
    }
}

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

// MARK: - Vibration Settings
enum AppVibration: String, CaseIterable {
    case on = "vibration_on"
    case off = "vibration_off"
    
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
    
    static func fromLocalizedString(_ string: String) -> AppVibration {
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

class ThemeManager: ObservableObject {
    @AppStorage("selectedTheme") private var storedTheme: String = AppTheme.system.rawValue
    
    var currentTheme: AppTheme {
        AppTheme(rawValue: storedTheme) ?? .system
    }
    
    func updateTheme(_ theme: AppTheme) {
        storedTheme = theme.rawValue
        
    }
    
    func updateThemeFromLocalizedString(_ localizedString: String) {
        let theme = AppTheme.fromLocalizedString(localizedString)
        storedTheme = theme.rawValue
    }
    
    func colorScheme() -> ColorScheme? {
        switch currentTheme {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return nil
        }
    }
}

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

