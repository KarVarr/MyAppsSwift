//
//  ContentView.swift
//  MindGrid
//
//  Created by Karen Vardanian on 13.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                GameView()
                    .tabItem {
                        Label("Game", systemImage: "gamecontroller.fill")
                    }
                    
                ScoreView()
                    .tabItem {
                        Label("Score", systemImage: "number")
                    }
                    
                    
                SettingView()
                    .tabItem {
                        Label("Info", systemImage: "info.square")
                    }
                   
            }
            .tint(.teal)
            .onAppear {
                UITabBar.appearance().unselectedItemTintColor = .lightGray
                UITabBar.appearance().backgroundColor = .secondarySystemBackground
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
