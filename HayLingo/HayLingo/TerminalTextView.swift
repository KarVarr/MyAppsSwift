//
//  TerminalTextView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct TerminalTextView: View {
    private let initialText = "հայԼինգո"
    private let targetText = "HayLingo"
    @State private var currentText = ""
    @State private var cursorPosition = 0
    @State private var isErasing = true
    @State private var showCursor = true
    @State private var isAnimationComplete = false
    
    // Timing constants
    private let cursorBlinkInterval = 0.6
    private let characterDelay = 0.15  // Единый интервал для стирания и печатания
    private let initialDelay = 1.0
    
    // Track if animation is complete
    @AppStorage("isAnimationComplete") private var isAnimationFinished: Bool = false

    var body: some View {
        HStack(spacing: 0) {
            // Text content
            Text(currentText)
                .font(.system(size: 46, weight: .bold, design: .monospaced))
                .foregroundStyle(Helper.ColorHex.red)
            
            // Cursor
            if !isAnimationComplete {
                Rectangle()
                    .frame(width: 20, height: 46)
                    .foregroundColor(Helper.ColorHex.red)
                    .opacity(showCursor ? 0.7 : 0)
            }
        }
        .onAppear {
            if !isAnimationFinished {  // Only start animation if it's not finished
                currentText = initialText
                startAnimation()
            } else {
                currentText = targetText  // Display final text if animation is complete
            }
            
            // Start cursor blinking after animation has started
            Timer.scheduledTimer(withTimeInterval: cursorBlinkInterval, repeats: true) { timer in
                if isAnimationComplete {
                    timer.invalidate()
                    showCursor = false
                } else {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showCursor.toggle()
                    }
                }
            }
        }
    }
    
    private func startAnimation() {
        // Initial delay before starting
        DispatchQueue.main.asyncAfter(deadline: .now() + initialDelay) {
            eraseText()
        }
    }
    
    private func eraseText() {
        guard isErasing else { return }
        
        if !currentText.isEmpty {
            // Erase one character
            DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay) {
                currentText = String(currentText.dropLast())
                eraseText()
            }
        } else {
            // When erasing is complete, start typing
            isErasing = false
            cursorPosition = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay) {
                typeText()
            }
        }
    }
    
    private func typeText() {
        guard !isErasing && cursorPosition < targetText.count else {
            isAnimationComplete = true  // Отмечаем завершение анимации
            isAnimationFinished = true  // Save animation completion status
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay) {
            let index = targetText.index(targetText.startIndex, offsetBy: cursorPosition)
            currentText += String(targetText[index])
            cursorPosition += 1
            typeText()
        }
    }
}




#Preview {
    ZStack {
        Color.white
            .edgesIgnoringSafeArea(.all)
        TerminalTextView()
    }
}
