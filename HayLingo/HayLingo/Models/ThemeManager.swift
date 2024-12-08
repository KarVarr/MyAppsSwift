//
//  ThemeManager.swift
//  HayLingo
//
//  Created by Karen Vardanian on 08.12.2024.
//

import Foundation
import SwiftUI

enum AppTheme: String {
    case light = "Light"
    case dark = "Dark"
    case system = "System"
}

class ThemeManager {
    @Published var currentTheme: AppTheme = .light
    
    func updateTheme(_ theme: AppTheme) {
        currentTheme = theme
    }
}
