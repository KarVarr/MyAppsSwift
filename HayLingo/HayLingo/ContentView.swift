//
//  ContentView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI
struct ContentView: View {
    @StateObject private var themeManager = ThemeManager()
    
    var body: some View {
        MainView()
            .environmentObject(themeManager)
            .preferredColorScheme(themeManager.colorScheme())
    }
}

#Preview {
    ContentView()
}
