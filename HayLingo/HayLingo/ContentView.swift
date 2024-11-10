//
//  ContentView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LettersView()
                .preferredColorScheme(.light)
                .tabItem {
                    Label("Letters", systemImage: "building.columns")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
