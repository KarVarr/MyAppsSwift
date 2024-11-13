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
        NavigationStack {
            ScrollView(showsIndicators: false) {
                CollectionView(selectedLetters: $selectedLetters)
                
                Button(action: {
                    if let user = userData.first {
                        let newProgress = ProgressData(language: "Russian", correctAnswer: 0, totalQuestion: selectedLetters.count)
                        user.progress.append(newProgress)
                        
                        try? context.save()
                        print("button pressed and data saved")
                    }
                }) {
                    NavigationLink(destination: LetterTrainerView()) {
                        Text("Start Game")
                    }
                    .buttonStyle(.automatic)
                }
            }
        }
    }
}
#Preview {
    LettersView()
}
