//
//  StartScreenView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 27.05.2023.
//

import SwiftUI
import CoreHaptics

struct StartScreenView: View {
    @Binding var engine: CHHapticEngine?
    var startButtonAction: () -> Void
    
    @State private var buttonIsPressed = false
    @State private var buttonImageColor = 0.5
    @State private var shadowRadius = 15
    
    @State private var scale = 1.5
    
    var body: some View {
        VStack{
            GeometryReader { geo in
                ZStack{
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                        .frame(maxWidth: geo.size.width / 1.5, maxHeight: geo.size.width )
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                        .shadow(radius: CGFloat(shadowRadius), x: CGFloat(shadowRadius), y: CGFloat(shadowRadius))
                    
                    
                    Image(systemName: "power")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white.opacity(buttonImageColor))
                        .frame(width: geo.size.width / 4, height: geo.size.height / 3)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                        .shadow(radius: 5, x: -1, y: -4)
                        .scaleEffect(scale)
                        .animation(.easeIn(duration: 1), value: scale)
                }
                .onAppear {
                    do {
                        try engine?.start()
                    } catch {
                        print("Failed to start the haptic engine: \(error)")
                    }
                }
                .onTapGesture {
                    startButtonAction()
                    startButton()
                }
                
            }
            
        }
    }
    
    func startButton() {
        if !buttonIsPressed {
            withAnimation {
                buttonImageColor = 1
                shadowRadius = 5
            }
            buttonIsPressed = true
        } else {
            withAnimation {
                buttonImageColor = 0.5
                shadowRadius = 15
            }
            buttonIsPressed = false
        }
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView(engine: .constant(nil), startButtonAction: {})
    }
}
