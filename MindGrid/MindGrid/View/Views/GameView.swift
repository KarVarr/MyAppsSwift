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
    @State private var stringsForSymbol = Array(repeating: "?", count: 25)
    @State private var numberToFind = 1
    
    @State private var timer: Timer?
    @State private var timeElapsed: Int16 = 0
    
    @State private var isShowingWinAlert = false
    @State private var isGameStarted = false
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 5), count: 5)
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                topSection(in: geometry)
                    .frame(height: geometry.size.height * 0.2)
                    .padding(.vertical, 10)
                
                gridSection
                    .frame(height: geometry.size.height * 0.6)
                    .padding(.vertical, 10)
                
                startRestartButton
                    .frame(height: geometry.size.height * 0.1)
                    .padding(.bottom, 10)
                Spacer()
            }
            .padding(.horizontal, 10)
            .background(colorScheme == .dark ? Color(hex: 0x002B5B) : Color(hex: 0xfff2cc))
        }
        .alert("Congratulations!", isPresented: $isShowingWinAlert) {
            Button("Ok") { isGameStarted = false }
            Button("Restart") { restartGame() }
        } message: {
            let formatTimeElapsed = String(format: "%02d:%02d", timeElapsed / 60, timeElapsed % 60)
            Text("You passed the test in \(formatTimeElapsed) seconds!")
        }
    }
    
    func topSection(in geometry: GeometryProxy) -> some View {
        VStack(spacing: 5) {
            Text("Symbol to find:")
                .font(.system(size: min(geometry.size.width, geometry.size.height) * 0.15, design: .monospaced))
                .minimumScaleFactor(0.5)
                .padding(.bottom, 10)
            Spacer()
            ZStack {
                Text("\(numberToFind)")
                    .font(.system(size: min(geometry.size.width, geometry.size.height) * 0.1, design: .monospaced))
                
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(lineWidth: 3)
                    .foregroundColor(Color(hex: 0xF4B183))
                    .frame(width: min(geometry.size.width, geometry.size.height) * 0.2, height: min(geometry.size.width, geometry.size.height) * 0.18)
            }
            Spacer()
            Text(String(format: "%02d:%02d", timeElapsed / 60, timeElapsed % 60))
                .font(.system(size: min(geometry.size.width, geometry.size.height) * 0.04, design: .monospaced))
                .foregroundColor(.indigo)
        }
    }
    
    var gridSection: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(0..<25, id: \.self) { index in
                Button(action: {
                    if isGameStarted {
                        haptics(.soft)
                        pressedButton(numbersForSymbol[index])
                    }
                }) {
                    Text(isGameStarted ? "\(numbersForSymbol[index])" : stringsForSymbol[index])
                }
                .buttonStyle(MyButtonStyleNumber())
                .aspectRatio(1, contentMode: .fit)
            }
        }
        .padding(.horizontal, 5)
    }
    
    var startRestartButton: some View {
        Button(isGameStarted ? "R E S T A R T" : "S T A R T") {
            haptics(.medium)
            if isGameStarted {
                restartGame()
            } else {
                startGame()
            }
        }
        .buttonStyle(MyButtonStyleRestart())
        .padding(.vertical, 5)
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
            timer?.invalidate()
            
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
        timer?.invalidate()
        timer = nil
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            timeElapsed += 1
        }
    }
    
    func startGame() {
        isGameStarted = true
        restartGame()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
