//
//  VStackContent.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct VStackContent: View {
    let title: String
    let subtitle: String?
    let width: CGFloat
    let backgroundColor: Color
    let textColor: Color?
    let spacing: CGFloat?
    let alignment: Alignment?
    let shadowColor: Color?
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text(title)
                .font(.headline)
                .foregroundStyle(textColor ?? .black)
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(textColor ?? .black)
            }
            
        }
        .frame(width: width, alignment: alignment ?? .leading)
        .padding()
        .background(backgroundColor)
        .cornerRadius(10)
        .shadow(color: shadowColor ?? .gray.opacity(0.3) ,radius: 20, x: 4, y: 4)
        
    }
}

#Preview {
    VStackContent(title: "title", subtitle: "subtitle", width: 250, backgroundColor: .black, textColor: .white, spacing: 10, alignment: .leading, shadowColor: .gray.opacity(0.3))
}
