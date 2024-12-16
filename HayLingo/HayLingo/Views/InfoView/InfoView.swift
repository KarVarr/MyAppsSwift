//
//  InfoView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 09.12.2024.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Icon App")
                Text("version: 1.0.0")
                Spacer()
                Text("show in appstore")
                Text("Rate the app")
                Text("Our other apps")
                Text("Clear data")
                
                Text("© 2024 Karen Vardanian")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.backgroundLightGray, dark: Helper.ColorHex.backgroundDarkGray, themeManager: themeManager, colorScheme: colorScheme))
    }
}

#Preview {
    InfoView()
        .environmentObject(ThemeManager())
}
