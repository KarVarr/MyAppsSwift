//
//  ContentView.swift
//  MindGrid
//
//  Created by Karen Vardanian on 13.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                GameView()
                    .tabItem {
                        Label("Game", systemImage: "gamecontroller.fill")
                    }
                    .tag(0)
                ScoreView()
                    .tabItem {
                        Label("Score", systemImage: "number")
                    }
                    .tag(1)
                SettingView()
                    .tabItem {
                        Label("Info", systemImage: "info.square")
                    }
                    .tag(2)
            }
            .tint(.teal) 
            .onAppear {
                UITabBar.appearance().unselectedItemTintColor = .lightGray
            }
        }
    }
    
    private func backgroundColor(for tab: Int) -> UIColor {
        switch tab {
        case 0: return UIColor.gray
        case 1: return UIColor.red
        case 2: return UIColor.lightGray
        default: return UIColor.gray
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
