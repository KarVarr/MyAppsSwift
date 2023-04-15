//
//  GameView.swift
//  MindGrid
//
//  Created by Karen Vardanian on 13.04.2023.
//
import CoreHaptics
import SwiftUI



struct GameView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var numbersForSymbol = (1...25).shuffled()
    @State private var symbolToFind = 1
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var startDate = Date.now
    @State private var timeElapsed: Int = 0
    
    @State private var isShowingWinAlert = false
    
    
    let columns = [
        GridItem(.adaptive(minimum: 65), spacing: 5),
    ]
    
    var body: some View {
        
        VStack {
            Group {
                Text("Symbol to find:")
                    .padding()
                Spacer()
                
                ZStack {
                    Text("\(symbolToFind)")
                        .padding()
                        .font(.system(size: 54, design: .monospaced))
                    Circle()
                        .stroke(lineWidth: 3)
                        .foregroundColor(.green)
                        .frame(width: 100)
                        .padding()
                }
                Text(String(format: "%02d:%02d", timeElapsed / 60, timeElapsed % 60))
                    .onReceive(timer) { _ in
                        timeElapsed += 1
                    }
                    .font(.system(size: 26, design: .monospaced))
                    .foregroundColor(.indigo)
            }
            .font(.custom("Copperplate", size: 38))
            
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(numbersForSymbol, id: \.self) { item in
                    Button(String(item)) {
                        haptics(.soft)
                        pressedButton(item)
                    }
                    .buttonStyle(MyButtonStyleNumber())
                    
                    
                    
                }
                
            }
           
            Button("R E S T A R T") {
                haptics(.medium)
                restartGame()
            }
            .buttonStyle(MyButtonStyleRestart())
            
        }
        .padding(10)
        .background(colorScheme == .dark ? Color.blue.opacity(0.3): Color.yellow.opacity(0.6))
        .alert("Congratulations!", isPresented: $isShowingWinAlert) {
            Button("Ok") {}
            Button("Restart") {restartGame()}
        } message: {
            let formatTimeElapsed = String(format: "%02d:%02d", timeElapsed / 60, timeElapsed % 60)
            Text("You passed the test in \(formatTimeElapsed) seconds!")
        }
        
    }
    
    func haptics(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impactMed = UIImpactFeedbackGenerator(style: style)
        impactMed.impactOccurred()
    }
    
    
    
    
    func pressedButton(_ num: Int) {
        if symbolToFind == num {
            symbolToFind += 1
            numbersForSymbol.shuffle()
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
        numbersForSymbol.shuffle()
        timer.upstream.connect().cancel()
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
