//
//  ThemeManager.swift
//  HayLingo
//
//  Created by Karen Vardanian on 08.12.2024.
//

import Foundation
import SwiftUI

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
