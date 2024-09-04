//
//  CustomButtonForIntensity.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 08.06.2023.
//

import SwiftUI

struct CustomButtonCircle: View {
    @Binding var buttonImageColor: Double
    @Binding var shadowRadius: Int
    @Binding var scale: Double
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(maxWidth: geo.size.width / 1.5, maxHeight: geo.size.width)
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)
                    .shadow(radius: CGFloat(shadowRadius))
                Image(systemName: "power")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white.opacity(buttonImageColor))
                    .frame(width: geo.size.width / 4, height: geo.size.height / 3)
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)
                    .scaleEffect(scale)
                    .animation(.easeIn(duration: 1), value: scale)
            }
        }
    }
}

struct CustomButtonForIntensity: View {
    var action: () -> Void
    var imageName: String
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [.white.opacity(0.7), .white.opacity(0.3)]),
                            startPoint: .top,
                            endPoint: .bottom
                        ), lineWidth: 5 )
                    .background(
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.secondary.opacity(0.5), Color.secondary.opacity(0.3)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    )
                    .shadow(radius: 3)
                Image(imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            .frame(width: 90, height: 90)
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    struct CustomButtonForIntensity_Previews: PreviewProvider {
        static var previews: some View {
            CustomButtonForIntensity(action: {}, imageName: "rabit")
        }
    }
}
