//
//  ContentView.swift
//  Pidget
//
//  Created by Karen Vardanian on 15.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea(.all)
                .overlay {
                    
                    VStack {
                        HStack {
                            Spacer()
                            Text("STAT")
                            Spacer()
                            Text("INV")
                            Spacer()
                            Text("DATA")
                            Spacer()
                            Text("MAP")
                            Spacer()
                        }
                        
                        Spacer()
                        Image("pipBoy1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                        Spacer()
                        HStack {
                            Spacer()
                            Text("HP 90/90")
                            Spacer()
                            Text("Level 35")
                            Spacer()
                            Text("AP 70/70")
                            Spacer()
                        }
                    }
                    .padding(.top)
                    .foregroundStyle(.green)
                    
                }
        }
        .frame(maxWidth: .infinity)
        
        
    }
}

#Preview {
    ContentView()
}
