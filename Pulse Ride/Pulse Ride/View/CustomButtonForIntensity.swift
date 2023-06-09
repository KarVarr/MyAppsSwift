//
//  CustomButtonForIntensity.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 08.06.2023.
//

import SwiftUI

struct CustomButtonForIntensity: View {
    var action: () -> Void
    var imageName: String
    @State private var buttonColor = Color.white
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [.white.opacity(0.7), .white.opacity(0.3)]),
                            startPoint: .top,
                            endPoint: .bottom
                        ), lineWidth: isPressed ? 5 : 2)
                    .background(
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [buttonColor.opacity(0.7), buttonColor.opacity(0.3)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    )
                    
                    .shadow(radius: isPressed ? 3 : 7)
                
                
                Image(imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            .frame(width: 100, height: 100)
            .scaleEffect(isPressed ? 0.93 : 1.0)
            .buttonStyle(PlainButtonStyle())
            .onTapGesture {
                withAnimation {
                    isPressed.toggle()
                    if buttonColor == Color.white {
                        self.buttonColor = Color.secondary
                    } else {
                        self.buttonColor = Color.white
                    }
                }
                action()
            }
        }
        
        
    }
}

struct CustomButtonForIntensity_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonForIntensity(action: {}, imageName: "rabit")
    }
}
