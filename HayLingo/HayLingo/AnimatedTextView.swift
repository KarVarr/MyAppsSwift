//
//  AnimatedTextView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct AnimatedTextView: View {
    @State private var viewId = UUID()
    private let initialText = Array("հայԼինգո").map(String.init)
    private let targetText = Array("HayLingo").map(String.init)
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<initialText.count, id: \.self) { index in
                ScrollingLetterView(
                    initialLetter: initialText[index],
                    targetLetter: targetText[index],
                    delay: Double(index) * 0.1
                )
            }
        }
        .id(viewId)
    }
}

struct ScrollingLetterView: View {
    let initialLetter: String
    let targetLetter: String
    let delay: Double
    
    @State private var offset: CGFloat = 0
    @State private var letters: [String] = []
    @State private var shouldAnimate = false
    
    private let animationDuration: Double = 3.0
    private let numberOfRotations = 3
    private let letterHeight: CGFloat = 50 // Уменьшенная высота для букв
    
    init(initialLetter: String, targetLetter: String, delay: Double) {
        self.initialLetter = initialLetter
        self.targetLetter = targetLetter
        self.delay = delay
        
        var generatedLetters: [String] = []
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzհայԼինգո"
            .map(String.init)
            .shuffled()
        
        for _ in 0..<numberOfRotations {
            generatedLetters.append(contentsOf: alphabet.prefix(6))
        }
        
        // Добавляем целевую букву в нормальной ориентации
        generatedLetters.append(targetLetter)
        
        _letters = State(initialValue: generatedLetters)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Фоновый цвет
                Helper.ColorHex.backgroundGray
                
                // Затемнение сверху
                LinearGradient(
                    gradient: Gradient(colors: [.black.opacity(0.3), .clear]),
                    startPoint: .top,
                    endPoint: .center
                )
                .frame(height: 20)
                .allowsHitTesting(false)
                .zIndex(1)
                
                // Затемнение снизу
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .black.opacity(0.3)]),
                    startPoint: .center,
                    endPoint: .bottom
                )
                .frame(height: 20)
                .allowsHitTesting(false)
                .zIndex(1)
                
                // Прокручивающиеся буквы
                VStack(spacing: 0) {
                    // Начальная буква
                    Text(initialLetter)
                        .font(.system(size: 46, weight: .bold, design: .monospaced))
                        .frame(height: letterHeight)
                        .foregroundColor(.red)
                        .opacity(shouldAnimate ? 0 : 1)
                    
                    // Прокручивающиеся буквы
                    ForEach(0..<letters.count, id: \.self) { index in
                        let progress = (CGFloat(index) * letterHeight + offset) / (geometry.size.height * 2)
                        
                        Text(letters[index])
                            .font(.system(size: 46, weight: .bold, design: .monospaced))
                            .frame(height: letterHeight)
                            .foregroundColor(.red)
                            .scaleEffect(
                                y: 1.0, // Сохраняем нормальную высоту
                                anchor: .center
                            )
                            .scaleEffect(scaleForProgress(progress))
                            .opacity(opacityForProgress(progress))
                    }
                }
                .offset(y: offset)
                .animation(
                    .linear(duration: animationDuration)
                    .delay(delay + 2.0),
                    value: offset
                )
            }
        }
        .frame(width: 40, height: letterHeight + 10) // Добавляем немного места сверху и снизу
        .clipShape(Rectangle())
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                offset = 0
                withAnimation(.linear(duration: 0.001).delay(delay + 2.0)) {
                    shouldAnimate = true
                }
                withAnimation(.linear(duration: animationDuration).delay(delay + 2.0)) {
                    offset = -CGFloat(letters.count) * letterHeight
                }
            }
        }
    }
    
    private func scaleForProgress(_ progress: CGFloat) -> CGFloat {
        let minScale: CGFloat = 0.85 // Минимальный масштаб
        let maxScale: CGFloat = 1.0  // Максимальный масштаб
        
        let normalizedProgress = progress - floor(progress)
        
        if normalizedProgress < 0.2 {
            return minScale + (maxScale - minScale) * (normalizedProgress / 0.2)
        } else if normalizedProgress > 0.8 {
            return maxScale - (maxScale - minScale) * ((normalizedProgress - 0.8) / 0.2)
        }
        
        return maxScale
    }
    
    private func opacityForProgress(_ progress: CGFloat) -> Double {
        let normalizedProgress = progress - floor(progress)
        
        if normalizedProgress < 0.2 {
            return 0.3 + 0.7 * (normalizedProgress / 0.2)
        } else if normalizedProgress > 0.8 {
            return 1.0 - 0.7 * ((normalizedProgress - 0.8) / 0.2)
        }
        
        return 1.0
    }
}

#Preview {
    AnimatedTextView()
}

