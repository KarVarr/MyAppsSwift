//
//  ContentView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 25.05.2023.
//

import SwiftUI

struct ContentView: View {
    let startScreen = StartScreenView()
    let hapticTouch = HapticsTouchGenerator()
    
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                StartScreenView()
                    .onTapGesture {
                        hapticTouch.simpleSuccess()
                    }
            }
            Button {
                hapticTouch.simpleSuccess()
            } label: {
                Text("Tap")
            }

            
           
            
        }
        

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
