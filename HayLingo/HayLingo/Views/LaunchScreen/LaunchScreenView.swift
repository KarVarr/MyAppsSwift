//
//  LaunchScreenView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 04.01.2025.
//

import SwiftUI

struct LaunchScreenView: View {
    @StateObject private var themeManager = ThemeManager()
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    private let iconSize: CGFloat = UIScreen.main.bounds.width * 0.25
    
    var body: some View {
        if isActive {
            ContentView()
                .environmentObject(themeManager)
        } else {
            GeometryReader { geometry in
                VStack(spacing: 20) {
                    Spacer()
                    
                    VStack(spacing: 15) {
                        Image("iconLight")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: iconSize, height: iconSize)
                            .clipShape(RoundedRectangle(cornerRadius: iconSize * 0.2))
                            .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
                        
                        Text("HayLingo")
                            .font(.system(size: iconSize * 0.4))
                            .fontWeight(.bold)
                            .foregroundColor(Helper.ColorHex.red)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}


#Preview {
    LaunchScreenView()
}
