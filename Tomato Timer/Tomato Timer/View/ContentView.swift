//
//  ContentView.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 19.01.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    
    var body: some View {
        if isFirstLaunch {
            OnboardingView()
        } else {
            MainView()
        }
            
    }
}

#Preview {
    ContentView()
}







