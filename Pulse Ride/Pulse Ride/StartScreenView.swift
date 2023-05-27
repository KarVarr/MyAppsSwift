//
//  StartScreenView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 27.05.2023.
//

import SwiftUI

struct StartScreenView: View {
    var body: some View {
        VStack{
            
            GeometryReader { geo in
                ZStack{
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                        .frame(maxWidth: geo.size.width - 50, maxHeight: geo.size.width - 50)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                        .shadow(radius: 15, x: 15, y: 15)
                        
                        
                    Button("RIDE", action: startButton)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
            }
        }
    }
    
    func startButton() {
        
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView()
    }
}
