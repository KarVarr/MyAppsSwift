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
    
    @State  var titleForButton = "START"
    @State private var circleWidth: CGFloat = 50
    
    
    
    var body: some View {
        VStack{
            GeometryReader { geo in
                ZStack{
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                        .frame(maxWidth: geo.size.width - circleWidth, maxHeight: geo.size.width - circleWidth)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                        .shadow(radius: 15, x: 15, y: 15)
                    
                    
                    Text(titleForButton)
                        .foregroundColor(.white.opacity(0.8))
                        .bold()
                        .font(.largeTitle)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
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
        if titleForButton == "START"  {
            titleForButton = "STOP"
            
            withAnimation {
                circleWidth = 150
            }
        } else {
            titleForButton = "START"
            withAnimation {
                circleWidth = 50
            }
        }
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView(engine: .constant(nil), startButtonAction: {})
    }
}
