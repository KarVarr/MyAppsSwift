//
//  CollectionViewCell.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct CollectionViewCell: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var themeManager: ThemeManager
    
    var backgroundColor: Color
    var index: Int
    var firstArmUppercaseLetter: String
    var secondArmLowercaseLetter: String
    var letterForStudy: String
    
    var body: some View {
        VStack {
            HStack {
                Text(firstArmUppercaseLetter)                    .minimumScaleFactor(0.2)
                    .foregroundStyle(Helper.ColorHex.black)
                Text(secondArmLowercaseLetter)
                    .dynamicTypeSize(.medium ... .xxLarge)
                    .foregroundStyle(Helper.ColorHex.black.opacity(0.8))
                
            }
            
            Text(letterForStudy)
                .font(.system(size: 20, weight: .bold))
                .dynamicTypeSize(.medium ... .xxLarge)
                .foregroundStyle(Helper.ColorHex.yellow)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .cornerRadius(10)
        .shadow(color: setShadow(), radius: 5, x: 0, y: 2)
        
    }
    
    private func setShadow() -> Color {
        switch themeManager.currentTheme {
        case .light:
            return .gray.opacity(0.3)
        case .dark:
            return .black.opacity(0.3)
        case .system:
            return colorScheme == .light ? .gray.opacity(0.2) : .black.opacity(0.2)
        }
    }

}

#Preview {
    CollectionViewCell(backgroundColor: Color.white, index: 1, firstArmUppercaseLetter: "Եվ", secondArmLowercaseLetter: "Եվ".lowercased(), letterForStudy: "ев")
        .environmentObject(ThemeManager())
}
