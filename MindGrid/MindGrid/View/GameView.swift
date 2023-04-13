//
//  GameView.swift
//  MindGrid
//
//  Created by Karen Vardanian on 13.04.2023.
//

import SwiftUI

struct GameView: View {
    @State private var symbolToFind = 1
    let numbersForSymbol = (1...25)
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var startDate = Date.now
    @State private var timeElapsed: Int = 0
    
    
    let columns = [
        GridItem(.adaptive(minimum: 70), spacing: 5),
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    Text("Symbol to find:")
                    
                    ZStack {
                        Text("\(symbolToFind)")
                            .padding(.vertical, 50)
                            .font(.system(size: 44))
                        Circle()
                            .stroke()
                            .foregroundColor(.green)
                            .frame(width: 100)
                    }
                    Text(String(format: "%02d:%02d", timeElapsed / 60, timeElapsed % 60))
                        .onReceive(timer) { firedDate in
                            timeElapsed = Int(firedDate.timeIntervalSince(startDate))
                        }
                        .font(.system(size: 26, design: .monospaced))
                }
                .font(.custom("Copperplate", size: 38))
                
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(numbersForSymbol, id: \.self) { item in
                        Text(String(item))
                            .font(.system(size: 44))
                            .fontWeight(.bold)
                            .frame(width: 75, height: 70)
                            .background(.mint)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(radius: 4)
                        
                    }
                    
                }
                .padding(.top, 30)
                
            }
            .padding(10)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
