//
//  GameView.swift
//  MindGrid
//
//  Created by Karen Vardanian on 13.04.2023.
//
import CoreHaptics
import SwiftUI



struct GameView: View {
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
//        ScrollView (showsIndicators: false){
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
                        Button(String(item)) {pressedButton(item)}
//                            .font(.system(size: 38, design: .monospaced))
//                            .foregroundColor(.white)
//                            .fontWeight(.bold)
//                            .frame(minWidth: 45, maxWidth: 70, minHeight: 50, maxHeight: 70)
//                            .background(.mint)
//                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
//                            .shadow(radius: 4)
                            .buttonStyle(MyButtonStyleNumber())
                            
                            
                        
                    }
                    
                }
//                .padding(.top, 30)
                
                
                Button("R E S T A R T") {
                    restartGame()
                }
                
                .buttonStyle(MyButtonStyleRestart())
                
            }
            .padding(10)
//        }
        .alert("Congratulations!", isPresented: $isShowingWinAlert) {
            Button("Ok") {}
            Button("Restart") {restartGame()}
        } message: {
            let formatTimeElapsed = String(format: "%02d:%02d", timeElapsed / 60, timeElapsed % 60)
            Text("You passed the test in \(formatTimeElapsed) seconds!")
        }
        
    }
    
   
    
    
    func pressedButton(_ num: Int) {
        if symbolToFind == num {
            numbersForSymbol.shuffle()
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
