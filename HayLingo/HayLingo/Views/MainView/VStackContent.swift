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
    let titleSize: CGFloat?
    let width: CGFloat
    let backgroundColor: Color
    let textColor: Color?
    let spacing: CGFloat?
    let alignment: Alignment?
    let shadowColor: Color?
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text(title)
                .font(.system(size: titleSize ?? 12))
                .foregroundStyle(textColor ?? .black)
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(textColor ?? .black)
            }
            
        }
        .frame(width: width, alignment: alignment ?? .leading)
        .padding()
        .background(backgroundColor)
        .cornerRadius(15)
        .shadow(color: shadowColor ?? .gray.opacity(0.25) ,radius: 5, x: 2, y: 2)
        
    }
}

#Preview {
    VStackContent(title: "title", subtitle: "subtitle", titleSize: 12, width: 250, backgroundColor: .black, textColor: .white, spacing: 10, alignment: .leading, shadowColor: .gray.opacity(0.3))
}
