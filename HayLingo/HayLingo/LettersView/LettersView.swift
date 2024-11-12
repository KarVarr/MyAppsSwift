//
//  LettersView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI
import SwiftData

struct LettersView: View {
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    
    @State private var selectedLetters: [String] = []
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            CollectionView(selectedLetters: $selectedLetters)
            Button("Start Game") {
                if let user = userData.first {
                    let newProgress = ProgressData(language: "Russian", correctAnswer: 0, totalQuestion: selectedLetters.count)
                    user.progress.append(newProgress)
                
                    try? context.save()
                }
            }
        }
    }
}

#Preview {
    LettersView()
}
