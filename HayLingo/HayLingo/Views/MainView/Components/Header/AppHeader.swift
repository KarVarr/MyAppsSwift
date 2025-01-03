//
//  AppHeader.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct AppHeader: View {
    let height: CGFloat
    let textColor: Color
    
    var body: some View {
        Text("HayLingo")
            .frame(height: height)
            .font(.system(size: 46, weight: .bold, design: .monospaced))
            .foregroundStyle(textColor)
    }
}
#Preview {
    AppHeader(height: 80, textColor: .red)
}
