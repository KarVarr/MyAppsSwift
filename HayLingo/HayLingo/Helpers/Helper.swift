//
//  Helper.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

enum Helper {
    enum ColorHex {
        static let backgroundLightGray = Color(hex: 0xf4f5f7)
        static let backgroundDarkGray = Color(hex: 0x292a2f)
        static let grey = Color(hex: 0x3a3a3b)
        static let white = Color(hex: 0xffffff)
        static let black = Color(hex: 0x000000)
        static let pink = Color(hex: 0xff00ff)
        static let darkGray = Color(hex: 0x505a64)
        static let red = Color(hex: 0xd90012)
        static let blue = Color(hex: 0x0033a0)
        static let orange = Color(hex: 0xf2a800)
        static let yellow = Color(hex: 0xFFD523)
        static let lightBlue = Color(hex: 0xF0EBE3)
        static let lightOrange = Color(hex: 0xf8ae97)
        static let lightGray = Color(hex: 0xB2B1B9)
        static let darkBlue = Color(hex: 0x3d4856)
        static let lightBlack = Color(hex: 0x2f342f)
        static let brightBlue = Color(hex: 0x0088ff)
    }
    
    enum Font {
        
    }
    
    enum ThemeColorManager {
        static func setColorInDarkMode(light lightColor: Color, dark darkColor: Color, themeManager: ThemeManager, colorScheme: ColorScheme) -> Color {
            switch themeManager.currentTheme {
            case .light:
                return lightColor
            case .dark:
                return darkColor
            case .system:
                return colorScheme == .light ? lightColor
                : darkColor
            }
        }
    }
    
}
