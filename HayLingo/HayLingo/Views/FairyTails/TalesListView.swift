//
//  TalesListView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI
import SwiftData

struct TalesListView: View {
    @Environment(\.modelContext) var context
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var settingsManager = BaseSettingsManager.shared
    @Query var userData: [UserData]
    
    let tales = FairyTales.getAllTales()
    let deviceType = DeviceType.current
    
    var body: some View {
        if deviceType == .pad {
            NavigationView {
                List(tales, id: \.id) { tale in
                    TaleRowView(tale: tale)
                        .listRowBackground(Helper.ColorHex.lightGray.opacity(0.3))
                }
                .scrollContentBackground(.hidden)
                .background(
                    Helper.ThemeColorManager.setColorInDarkMode(
                        light: Helper.ColorHex.backgroundLightGray,
                        dark: Helper.ColorHex.backgroundDarkGray,
                        themeManager: settingsManager,
                        colorScheme: colorScheme
                    )
                )
                .listStyle(.insetGrouped)
                .navigationTitle("Fairy Tales")
                
                // Второе представление для iPad
                WelcomeTalesView()
            }
            .navigationViewStyle(.columns)
        } else {
            NavigationView {
                List(tales, id: \.id) { tale in
                    TaleRowView(tale: tale)
                        .listRowBackground(Helper.ColorHex.lightGray.opacity(0.3))
                }
                .scrollContentBackground(.hidden)
                .background(
                    Helper.ThemeColorManager.setColorInDarkMode(
                        light: Helper.ColorHex.backgroundLightGray,
                        dark: Helper.ColorHex.backgroundDarkGray,
                        themeManager: settingsManager,
                        colorScheme: colorScheme
                    )
                )
                .listStyle(.insetGrouped)
                .navigationTitle("Fairy Tales")
            }
        }
    }
}


#Preview {
    TalesListView()
        .environmentObject(ThemeManager())
}

