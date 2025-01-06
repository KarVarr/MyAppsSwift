//
//  WelcomeTalesView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 06.01.2025.
//

import SwiftUI

// MARK: - Feature Row
struct FeatureRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .frame(width: 30)
                .foregroundColor(.orange)
            
            Text(text)
                .font(.body)
        }
    }
}

struct WelcomeTalesView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var settingsManager = BaseSettingsManager.shared
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 60))
                .foregroundColor(.orange)
            
            Text("Welcome to Armenian Fairy Tales")
                .font(.title)
                .bold()
            
            Text("Select a tale from the list to start reading")
                .font(.title3)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 12) {
                FeatureRow(icon: "sidebar.left", text: "Browse through classic Armenian tales")
                FeatureRow(icon: "text.alignleft", text: "Adjust text size for comfortable reading")
                FeatureRow(icon: "clock", text: "See estimated reading times")
                FeatureRow(icon: "tag", text: "Find stories by tags and age groups")
            }
            .padding(.top, 40)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Helper.ThemeColorManager.setColorInDarkMode(
                light: Helper.ColorHex.backgroundLightGray,
                dark: Helper.ColorHex.backgroundDarkGray,
                themeManager: settingsManager,
                colorScheme: colorScheme
            )
        )
    }
}

#Preview {
    WelcomeTalesView()
}
