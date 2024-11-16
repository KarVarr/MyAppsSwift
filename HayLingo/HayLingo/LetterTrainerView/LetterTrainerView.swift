//
//  LetterTrainerView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 13.11.2024.
//

import SwiftUI
import SwiftData

struct LetterTrainerView: View {
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    
    @Binding var selectedLetters: [String]
    @StateObject private var viewModel: LetterTrainerViewModel
    
    init(selectedLetters: Binding<[String]>) {
        _selectedLetters = selectedLetters
        _viewModel = StateObject(wrappedValue: LetterTrainerViewModel(selectedLetters: selectedLetters.wrappedValue))
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    //                    CurrentLetterView(letter: viewModel.currentLetter, image: viewModel.currentImage)
                    //                    CurrentLetterView(letter: viewModel.currentLetter)
                    CurrentLetterView(letter: "d")
                        .padding()
                        .frame(maxWidth: geometry.size.width, minHeight: geometry.size.height / 4, maxHeight: geometry.size.height / 4)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(Helper.ColorHex.white)
                                .shadow(radius: 10)
                        )
                        .padding()
                    Spacer()
                    
                    AnswerChoicesView(choices: viewModel.answerChoices, selectedChoice: $viewModel.selectedChoice) { choice in
                        //                    AnswerChoicesView(choices: ["viewModel.answerChoices"], selectedChoice: $"$viewModel.selectedChoice") { choice in
                        //                        viewModel.checkAnswer(choice)
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
        .background(Helper.ColorHex.backgroundGray)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.startTraining(selectedLetters: selectedLetters)
            //            viewModel.startTraining()
        }
    }
}

#Preview {
    LetterTrainerView(selectedLetters: .constant(["Օ"]))
}

