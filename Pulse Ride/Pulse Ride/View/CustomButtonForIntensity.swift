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
