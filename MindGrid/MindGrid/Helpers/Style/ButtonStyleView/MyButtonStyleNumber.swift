//
//  MyButtonStyleNumber.swift
//  MindGrid
//
//  Created by Karen Vardanian on 14.04.2023.
//

import SwiftUI


struct MyButtonStyleNumber: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 42, design: .monospaced))
            .foregroundColor(Color(hex: colorScheme == .dark ? 0x181823 : 0xEDF1D6))
            .fontWeight(.bold)
            .frame(minWidth: 45, maxWidth: 70, minHeight: 50, maxHeight: 70)
            .background(Color(hex: colorScheme == .dark ? 0x0E8388 : 0x609966))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(radius: 4)
            
    }
       
}
