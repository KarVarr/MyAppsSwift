//
//  AppTheme.swift
//  HayLingo
//
//  Created by Karen Vardanian on 06.01.2025.
//

import Foundation

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
