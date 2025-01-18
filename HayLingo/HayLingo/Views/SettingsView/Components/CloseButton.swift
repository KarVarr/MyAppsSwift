//
//  CloseButton.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct CloseButton: View {
    @Binding var showSettings: Bool
    @Environment(\.colorScheme) var colorScheme
    
    let userData: [UserData]
    let settingsManager: BaseSettingsManager
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(backgroundColor)
            
            Text("Close")
                .foregroundStyle(foregroundColor)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .contentShape(Rectangle())
        .onTapGesture {
            showSettings = false
            Helper.SoundClick.triggerSound(userData: userData)
            Helper.Haptic.triggerVibration(userData: userData, style: .light)
        }
    }
    
    private var backgroundColor: Color {
        Helper.ThemeColorManager.setColorInDarkMode(
            light: Helper.ColorHex.grey.opacity(0.15),
            dark: Helper.ColorHex.blue.opacity(0.2),
            themeManager: settingsManager,
            colorScheme: colorScheme
        )
    }
    
    private var foregroundColor: Color {
        Helper.ThemeColorManager.setColorInDarkMode(
            light: Helper.ColorHex.darkBlue,
            dark: Helper.ColorHex.black,
            themeManager: settingsManager,
            colorScheme: colorScheme
        )
    }
}
