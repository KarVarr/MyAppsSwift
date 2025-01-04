//
//  ConfettiView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 14.12.2024.
//

import SwiftUI

struct ConfettiView: View {
    @State private var isConfettiActive = false
    
    var body: some View {
        ZStack {
            Button("Win!") {
                withAnimation {
                    isConfettiActive = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isConfettiActive = false
                    }
                }
            }
            
            if isConfettiActive {
                GeometryReader { geometry in
                    ZStack {
                        ForEach(0..<50) { index in
                            ConfettiParticle(
                                containerSize: geometry.size,
                                startIndex: index
                            )
                        }
                    }
                }
                .allowsHitTesting(false)
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    ConfettiView()
}
