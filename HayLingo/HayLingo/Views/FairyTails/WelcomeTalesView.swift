//
//  WelcomeTalesView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 06.01.2025.
//

import SwiftUI

struct WelcomeTalesView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var settingsManager = BaseSettingsManager.shared
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 60))
                .foregroundColor(.orange)
            
            Text("welcome.title")
                .font(.title)
                .bold()
            
            Text("welcome.subtitle")
                .font(.title3)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 12) {
                FeatureRow(icon: "sidebar.left", text: "feature.browse")
                FeatureRow(icon: "text.alignleft", text: "feature.text.size")
                FeatureRow(icon: "clock", text: "feature.reading.time")
                FeatureRow(icon: "tag", text: "feature.tags")
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
            
            Text(NSLocalizedString(text, comment: ""))
                .font(.body)
        }
    }
}

#Preview {
    WelcomeTalesView()
}
