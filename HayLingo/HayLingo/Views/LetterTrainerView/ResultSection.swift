//
//  ResultSection.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct ResultSection: View {
    @Environment(\.presentationMode) private var presentationMode
    var viewModel: LettersTrainerViewModel
    var geometry: GeometryProxy
    
    var body: some View {
        VStack {
            resultTitle()
            wrongLettersView()
            resultDescription()
            playAgainButton(geometry: geometry)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Helper.ColorHex.white)
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 4, y: 4)
        }
    }
    
    private func resultTitle() -> some View {
        Text(
            viewModel.score == viewModel.selectedLetters.count
            ? "Отлично!"
            : "Эти буквы нужно повторить:"
        )
        .font(.title)
    }
    
    private func wrongLettersView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(viewModel.wrongAnswers.joined(separator: ", "))
                .font(.title)
        }
        .padding()
    }
    
    private func resultDescription() -> some View {
        Group {
            Text("Правильных ответов \(viewModel.score) из \(viewModel.selectedLetters.count)")
                .font(.title2)
                .padding()
            
            Text(
                viewModel.score == viewModel.selectedLetters.count
                ? "Вы знайте все выбранные буквы!"
                : "У Вас все получиться!"
            )
            .font(.headline)
        }
    }
    
    private func playAgainButton(geometry: GeometryProxy) -> some View {
        Button {
            viewModel.playAgain()
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Сыграть еще раз!")
                .font(.headline)
                .foregroundStyle(Helper.ColorHex.white)
                .frame(maxWidth: geometry.size.width, maxHeight: 100)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Helper.ColorHex.blue)
                }
                .padding()
        }
    }
}

#Preview {
    GeometryReader { geometry in
        ResultSection(viewModel: LettersTrainerViewModel(), geometry: geometry)
    }
}
