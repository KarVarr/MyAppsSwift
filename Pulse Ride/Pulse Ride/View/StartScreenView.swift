//
//  StartScreenView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 08.10.2024.
//

import SwiftUI

struct StartScreenView: View {
    @Binding var showStartScreen: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Welcome to Ock Massager")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 20)
                .padding(.horizontal, 10)
                .minimumScaleFactor(0.4)
            Text("""
This app is designed to help you relax and relieve muscle tension using gentle vibrations.
Hold your device against the area where you want to soothe muscle discomfort, such as your neck, shoulders, or back.

Note: This app is intended for muscle relaxation and massage only. 
""")
            .font(.title3)
            .foregroundColor(.black.opacity(0.7))
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .minimumScaleFactor(0.4)
            Spacer()
            
            Image("massage")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .foregroundColor(.white.opacity(0.8))
                .padding(.bottom, 30)
            
            Spacer()
            
            // 'Got it' Button
            Button(action: {
                withAnimation {
                    showStartScreen = false
                    UserDefaults.standard.set(true, forKey: "hasSeenStartScreen")
                }
            }) {
                Text("Got it")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            Spacer(minLength: 50)
        }
        .background(Color.white)
        .zIndex(1)
    }
}
