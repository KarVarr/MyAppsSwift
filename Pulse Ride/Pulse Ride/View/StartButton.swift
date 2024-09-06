//
//  StartButton.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 27.05.2023.
//

import SwiftUI
import CoreHaptics

struct StartButton: View {
    @Binding var engine: CHHapticEngine?
    @Binding var isPlaying: Bool
    var startButtonAction: () -> Void
    var prepare: () -> Void
    var stop: () -> Void
    
    @State private var buttonImageColor = 0.5
    @State private var shadowRadius = 15
    @State private var scale = 1.5
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(maxWidth: geo.size.width / 1.5, maxHeight: geo.size.width)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                        .shadow(radius: CGFloat(shadowRadius), x: CGFloat(shadowRadius), y: CGFloat(shadowRadius))
                    
                    Image(systemName: "power")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white.opacity(buttonImageColor))
                        .frame(width: geo.size.width / 4, height: geo.size.height / 3)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                        .scaleEffect(scale)
                        .animation(.easeIn(duration: 1), value: scale)
                }
                .onAppear {
                    prepare()
                }
                .onTapGesture {
                    if !isPlaying {
                        startButtonAction()
                    } else {
                        stop()
                    }
                    toggleButton()
                }
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                if isPlaying {
                    resetButtonState()
                    stop()
                }
            } else if newPhase == .background {
                if isPlaying {
                    resetButtonState()
                    stop()
                }
            }
        }
    }
    
    func toggleButton() {
        withAnimation {
            buttonImageColor = isPlaying ? 1 : 0.5
            shadowRadius = isPlaying ? 5 : 15
        }
        isPlaying.toggle()
    }
    
    func resetButtonState() {
        withAnimation {
            buttonImageColor = 0.5
            shadowRadius = 15
        }
        isPlaying = false
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartButton(engine: .constant(nil), isPlaying: .constant(false), startButtonAction: {}, prepare: {}, stop: {})
    }
}
