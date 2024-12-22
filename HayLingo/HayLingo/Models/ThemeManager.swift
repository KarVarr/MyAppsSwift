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
    case russian = "russian"
    case english = "english"
    
    var localizedString: String {
        switch self {
        case .russian:
            switch Locale.current.language.languageCode?.identifier {
            case "ru":
                return "Русский"
            case "hy":
                return "Ռուսերեն"
            default:
                return "Russian"
            }
        case .english:
            switch Locale.current.language.languageCode?.identifier {
            case "ru":
                return "Английский"
            case "hy":
                return "Անգլերեն"
            default:
                return "English"
            }
        }
    }
    
    static func fromLocalizedString(_ string: String) -> AppLanguage {
        for language in AppLanguage.allCases {
            if language.localizedString == string {
                return language
            }
        }
        return .russian
    }
}

// MARK: - Theme Settings
enum AppTheme: String, CaseIterable {
    case light = "light"
    case dark = "dark"
    case system = "system"
    
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
        return .system // возвращаем значение по умолчанию
    }
}

// MARK: - Sound Settings
enum AppSound: String, CaseIterable {
    case on = "on"
    case off = "off"
    
    var localizedString: String {
        switch self {
        case .on:
            switch Locale.current.language.languageCode?.identifier {
            case "ru":
                return "Включено"
            case "hy":
                return "Միացված"
            default:
                return "On"
            }
        case .off:
            switch Locale.current.language.languageCode?.identifier {
            case "ru":
                return "Выключено"
            case "hy":
                return "Անջատված"
            default:
                return "Off"
            }
        }
    }
    
    static func fromLocalizedString(_ string: String) -> AppSound {
        for sound in AppSound.allCases {
            if sound.localizedString == string {
                return sound
            }
        }
        return .on
    }
}

// MARK: - Vibration Settings
enum AppVibration: String, CaseIterable {
    case on = "on"
    case off = "off"
    
    var localizedString: String {
        switch self {
        case .on:
            switch Locale.current.language.languageCode?.identifier {
            case "ru":
                return "Включено"
            case "hy":
                return "Միացված"
            default:
                return "On"
            }
        case .off:
            switch Locale.current.language.languageCode?.identifier {
            case "ru":
                return "Выключено"
            case "hy":
                return "Անջատված"
            default:
                return "Off"
            }
        }
    }
    
    static func fromLocalizedString(_ string: String) -> AppVibration {
        for vibration in AppVibration.allCases {
            if vibration.localizedString == string {
                return vibration
            }
        }
        return .on
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

