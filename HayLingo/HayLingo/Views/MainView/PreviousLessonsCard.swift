//
//  PreviousLessonsCard.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct PreviousLessonsCard: View {
    let width: CGFloat
    let progress: String
    let backgroundColor: Color
    let textColor: Color
    let shadowColor: Color
    
    var body: some View {
        VStackContent(
            title: NSLocalizedString("Previous lessons", comment: ""),
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


#Preview {
    PreviousLessonsCard(width: 300, progress: "5/10", backgroundColor: .white, textColor: .black, shadowColor: .black)
}
