//
//  TotalProgressCard.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct TotalProgressCard: View {
    let width: CGFloat
    let progress: String
    let currentLanguage: String
    let backgroundColor: Color
    let textColor: Color
    let shadowColor: Color
    
    var body: some View {
        VStackContent(
            title: NSLocalizedString("Your progress", comment: "") + " (\(currentLanguage))",
            subtitle: progress,
            titleSize: 12,
            width: width,
            backgroundColor: backgroundColor,
            textColor: textColor,
            spacing: 10,
            alignment: .leading,
            shadowColor: shadowColor
        )
    }
}
