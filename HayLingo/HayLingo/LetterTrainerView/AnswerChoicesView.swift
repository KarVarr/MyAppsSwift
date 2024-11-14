//
//  AnswerChoicesView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 14.11.2024.
//

import SwiftUI

struct AnswerChoicesView: View {
    let choices: [String]
    @Binding var selectedChoice: String?
    let onSelect: (String) -> Void
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 1)) {
            ForEach(choices, id: \.self) { choice in
                Button {
                    selectedChoice = choice
                    onSelect(choice)
                } label: {
                    AnswerChoiceView
                }

                
            }
        }
        
    }
}

#Preview {
    @Previewable @State var selectedChoice: String? = nil
    AnswerChoicesView(choices: ["a", "b", "c"], selectedChoice: $selectedChoice) { choice in
        print("Selected \(choice)")
    }
}
