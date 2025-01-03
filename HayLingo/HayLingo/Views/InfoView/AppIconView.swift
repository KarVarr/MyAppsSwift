//
//  AppIconView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct AppIconView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Image(colorScheme == .light ? "iconLight" : "iconDark")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.3), radius: 5, x: 3, y: 3)
            .padding(.vertical, 10)
    }
}


#Preview {
    AppIconView()
}
