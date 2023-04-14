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
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var startDate = Date.now
    @State private var timeElapsed: Int = 0
    
    @State private var isShowingWinAlert = false
    
    
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
                        .onReceive(timer) { _ in
                            timeElapsed += 1
                        }
                        .font(.system(size: 26, design: .monospaced))
                }
                .font(.custom("Copperplate", size: 38))
                
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(numbersForSymbol, id: \.self) { item in
                        Button(String(item)) {pressedButton(item)}
                            .font(.system(size: 44))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 75, height: 70)
                            .background(.mint)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(radius: 4)
                        
                    }
                    
                }
                .padding(.top, 30)
                
                Button("Restart") {
                    restartGame()
                }
                
            }
            .padding(10)
        }
        .alert("Congratulations!", isPresented: $isShowingWinAlert) {
            Button("Ok") {}
            Button("Restart") {restartGame()}
        } message: {
            Text("You passed the test in \(String(format: "%02d:%02d", timeElapsed / 60, timeElapsed % 60)) seconds!")
        }
        
        
        
    }
    
    
    func pressedButton(_ num: Int) {
        if symbolToFind == num {
            symbolToFind += 1
        }
        if symbolToFind == 26 {
            symbolToFind = 25
            isShowingWinAlert = true
            timer.upstream.connect().cancel()
            
        }
        
    }
    
    
    func restartGame() {
        symbolToFind = 1
        timeElapsed = 0
        timer.upstream.connect().cancel()
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
