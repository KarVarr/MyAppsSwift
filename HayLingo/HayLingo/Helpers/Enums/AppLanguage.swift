//
//  AppLanguage.swift
//  HayLingo
//
//  Created by Karen Vardanian on 06.01.2025.
//

import Foundation

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
