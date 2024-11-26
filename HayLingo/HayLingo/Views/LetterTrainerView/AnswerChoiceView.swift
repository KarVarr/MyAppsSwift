//
//  AnswerChoiceView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 14.11.2024.
//

import SwiftUI

struct AnswerChoiceView: View {
    let text: String
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Text(text)
                .font(Font.system(size: 64))
                .foregroundStyle(.white)
                .frame(minWidth: 150, maxWidth: .infinity, maxHeight: 80, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(isSelected ? Helper.ColorHex.blue : Helper.ColorHex.orange)
                }
        }
    }
}

#Preview {
    AnswerChoiceView(text: "letter", isSelected: false)
}
