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
                .preferredColorScheme(.light)
                .tabItem {
                    Label("Products", systemImage: "house.fill")
                }
            CategoriesView()
                .preferredColorScheme(.light)
                .tabItem {
                    Label("Categories", systemImage: "opticaldiscdrive")
                }
            ProfileView()
                .preferredColorScheme(.light)
                .tabItem {
                    Label("Profile", systemImage: "pawprint.fill")
                }
            SubscriptionView()
                .preferredColorScheme(.light)
                .tabItem {
                    Label("Subscription", systemImage: "box.truck.fill")
                }
            SettingsView()
                .preferredColorScheme(.light)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
