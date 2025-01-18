//
//  NavigationButtonsSection.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct NavigationButtonsSection: View {
    let width: CGFloat
    let shadowColor: Color
    let userData: [UserData]
    @Binding var showSettings: Bool
//    @Binding var settingsCount: Int
    
    var body: some View {
        VStack(spacing: 20) {
            FairyTalesButton(
                width: width,
                shadowColor: shadowColor,
                userData: userData
            )
            
            SettingsButton(
                width: width,
                shadowColor: shadowColor,
                action: {
                    showSettings = true
                }, userData: userData
            )
            
            StudyButton(
                width: width,
                shadowColor: shadowColor,
                userData: userData
            )
        }
    }
}

#Preview {
    NavigationButtonsSection(
        width: 300,
        shadowColor: .gray.opacity(0.3),
        userData: [],
        showSettings: .constant(false)
    )
}
