//
//  ConfettiParticle.swift
//  HayLingo
//
//  Created by Karen Vardanian on 04.01.2025.
//

import SwiftUI

struct ConfettiParticle: View {
    let containerSize: CGSize
    let startIndex: Int
    
    @State private var offset: CGFloat = 0
    @State private var rotation: Double = 0
    @State private var opacity: Double = 1
    
    private var randomColor: Color {
        let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .pink]
        return colors.randomElement() ?? .red
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: CGFloat.random(in: 5...15), style: .continuous)
            .fill(randomColor)
            .frame(
                width: CGFloat.random(in: 5...15),
                height: CGFloat.random(in: 10...25)
            )
            .rotationEffect(Angle(degrees: rotation))
            .opacity(opacity)
            .position(
                x: containerSize.width * (CGFloat(startIndex) / 50),
                y: -containerSize.height * 0.2 + offset
            )
            .onAppear {
                let randomDelay = Double.random(in: 0...0.5)
                let fallDuration = Double.random(in: 2...3)
                
                withAnimation(
                    .easeIn(duration: fallDuration)
                    .delay(randomDelay)
                ) {
                    offset = containerSize.height + 100
                    rotation = Double.random(in: -360...360)
                    opacity = 0
                }
            }
    }
}
