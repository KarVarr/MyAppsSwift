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
    
    @StateObject private var viewModel = LetterTrainerViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                CollectionView(selectedLetters: $viewModel.selectedLetters)
                
                //                Button(action: {
                //                    if let user = userData.first {
                //                        let newProgress = ProgressData(language: "Russian", correctAnswer: 0, totalQuestion: $viewModel.selectedLetters.count)
                //                        user.progress.append(newProgress)
                //                        
                //                        try? context.save()                    }
                //                }) {
                //                    NavigationLink(destination: LetterTrainerView()) {
                //                        Text("Start Game")
                //                    }
                //                    .buttonStyle(.automatic)
                //                }
                NavigationLink(destination: LetterTrainerView()) {
                    Text("Start Game")
                }
            }
        }
    }
}
#Preview {
    LettersView()
}
