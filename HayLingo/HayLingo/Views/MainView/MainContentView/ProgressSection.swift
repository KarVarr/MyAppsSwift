//
//  ProgressSection.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct ProgressSection: View {
    let width: CGFloat
    let latestProgress: String
    let allProgress: String
    let currentLanguage: String
    let backgroundColor: Color
    let textColor: Color
    let shadowColor: Color
    
    var body: some View {
        VStack(spacing: 20) {
            PreviousLessonsCard(
                width: width,
                progress: latestProgress,
                backgroundColor: backgroundColor,
                textColor: textColor,
                shadowColor: shadowColor
            )
            
            TotalProgressCard(
                width: width,
                progress: allProgress,
                currentLanguage: currentLanguage,
                backgroundColor: backgroundColor,
                textColor: textColor,
                shadowColor: shadowColor
            )
        }
    }
}

#Preview {
    ProgressSection(
        width: 300,
        latestProgress: "5/10",
        allProgress: "25/50",
        currentLanguage: "English",
        backgroundColor: .white,
        textColor: .black,
        shadowColor: .gray.opacity(0.3)
    )
}
