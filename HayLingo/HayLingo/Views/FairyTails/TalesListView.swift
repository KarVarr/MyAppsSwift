//
//  TalesListView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct TalesListView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var themeManager: ThemeManager
    let tales = FairyTales.getAllTales()
    
    
    var body: some View {
        NavigationView {
            List(tales, id: \.id) { tale in
                NavigationLink(destination: TaleDetailView(tale: tale)) {
                    TaleRowView(tale: tale)
                }
                .listRowBackground(Helper.ColorHex.orange)
            }
            .scrollContentBackground(.hidden)
            .background(Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.backgroundLightGray, dark: Helper.ColorHex.backgroundDarkGray, themeManager: themeManager, colorScheme: colorScheme))
            .listStyle(.insetGrouped)
            .navigationTitle("Fairy Tales")
        }
    }
}

#Preview {
    TalesListView()
        .environmentObject(ThemeManager())
}
