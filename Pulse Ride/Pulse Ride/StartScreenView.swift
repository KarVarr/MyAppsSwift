//
//  StartScreenView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 27.05.2023.
//

import SwiftUI

struct StartScreenView: View {
    @State private var titleForButton = "START"
    
    @State private var circleWidth: CGFloat = 50
    @State private var circlePosition: CGFloat = 2
    
    var body: some View {
        VStack{
            
            GeometryReader { geo in
                ZStack{
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                        .frame(maxWidth: geo.size.width - circleWidth, maxHeight: geo.size.width - circleWidth)
                        .position(x: geo.size.width / 2, y: geo.size.height / circlePosition)
                        .shadow(radius: 15, x: 15, y: 15)
                        .onTapGesture {
                            startButton()
                        }
                    
                    Text(titleForButton)
                        .foregroundColor(.secondary)
                        .bold()
                        .font(.largeTitle)
                    
                }
                
                
            }
        }
    }
    
    func startButton() {
        if titleForButton == "START"  {
            withAnimation {
                titleForButton = "STOP"
                
                circleWidth = 150
                circlePosition = 4
            }
        } else {
            withAnimation {
                titleForButton = "START"
                
                circleWidth = 50
                circlePosition = 2
            }
        }
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView()
    }
}
