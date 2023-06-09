//
//  GameView.swift
//  MindGrid
//
//  Created by Karen Vardanian on 13.04.2023.
//
import CoreHaptics
import SwiftUI



struct GameView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var times: FetchedResults<Score>
    
    @Environment(\.colorScheme) var colorScheme
    
    let lightGradientColorScheme = AngularGradient(gradient: Gradient(colors: [.orange, .yellow]), center: .center)
    

    
    @State private var numbersForSymbol = (1...25).shuffled()
    @State private var numberToFind = 1
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var startDate = Date.now
    @State private var timeElapsed: Int16 = 0
    
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
                        
                        Text("\(numberToFind)")
                            .padding()
                            .font(.system(size: 54, design: .monospaced))
                        
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color(hex: 0xF4B183))
                            .frame(width: 110, height: 100)
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
            .background(colorScheme == .dark ? Color(hex: 0x002B5B) : Color(hex: 0xfff2cc))
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
        if numberToFind == num {
            numberToFind += 1
            numbersForSymbol.shuffle()
        }
        if numberToFind == 26 {
            numberToFind = 25
            isShowingWinAlert = true
            timer.upstream.connect().cancel()
            
            let scoreTime = Score(context: moc)
            scoreTime.id = UUID()
            scoreTime.time = timeElapsed
            scoreTime.date = Date.now
            
            try? moc.save()
        }
        
    }
    
    func restartGame() {
        numberToFind = 1
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


