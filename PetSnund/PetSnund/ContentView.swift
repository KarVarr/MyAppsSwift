//
//  ContentView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProductsView()
                .tabItem {
                    Label("Products", systemImage: "list.bullet")
                }
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "opticaldiscdrive")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "pawprint.fill")
                }
            SubscriptionView()
                .tabItem {
                    Label("Subscription", systemImage: "box.truck.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
