//
//  ResultSection.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI
import SwiftData

struct ResultSection: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    @ObservedObject var viewModel: LettersTrainerViewModel
    var geometry: GeometryProxy
    
    @State private var isConfettiActive = false
    
    var body: some View {
        ZStack {
            VStack {
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Helper.ColorHex.backgroundLightGray)
            
            if isConfettiActive {
                GeometryReader { geometry in
                    ZStack {
                        ForEach(0..<50) { index in
                            ConfettiParticle(
                                containerSize: geometry.size,
                                startIndex: index
                            )
                        }
                    }
                }
                .allowsHitTesting(false)
                .ignoresSafeArea()
            }
        }
        .onAppear {
            if viewModel.score == viewModel.selectedLetters.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    withAnimation {
                        isConfettiActive = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            isConfettiActive = false
                        }
                    }
                }
            }
        }
    }
    
    
    private func resultTitle() -> some View {
        Text(
            viewModel.score == viewModel.selectedLetters.count
            ? "Отлично!"
            : viewModel.wrongAnswers.count == 1 ? "Эту буквы нужно повторить:" : "Эти буквы нужно повторить:"
        )
        .dynamicTypeSize(.small)
    }
    
    private func wrongLettersView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            if viewModel.wrongAnswers.isEmpty {
                Image(systemName: "dog")
            } else {
                Text(viewModel.wrongAnswers.joined(separator: ", "))
                    .font(.title)
            }
        }
        .padding()
    }
    
    private func resultDescription() -> some View {
        Group {
            Text("Ваш прогресс: \(viewModel.score) из \(viewModel.selectedLetters.count)")
                .fontWeight(.light)
                .padding()
            
            Text(
                viewModel.score == viewModel.selectedLetters.count
                ? "Все буквы угаданы верно!"
                : "Не сдавайтесь, у Вас обязательно получится!"
            )
            .fontWeight(.regular)
        }
    }
    
    private func playAgainButton(geometry: GeometryProxy) -> some View {
        Button {
            updateUserProgress(correct: viewModel.score, total: viewModel.selectedLetters.count, language: viewModel.selectedLanguage)
            viewModel.playAgain()
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Сыграть еще раз!")
                .font(.title)
                .dynamicTypeSize(.medium ... .xxxLarge)
                .foregroundStyle(Helper.ColorHex.white)
                .frame(maxWidth: geometry.size.width, maxHeight: 100)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Helper.ColorHex.blue)
                }
                .padding()
        }
    }
    
    private func updateUserProgress(correct: Int, total: Int, language: String) {
        if let user = userData.first {
            let newProgress = ProgressData(language: language, correctAnswer: correct, totalQuestion: total)
            user.progress.append(newProgress)
            try? context.save()
        }
    }
}

#Preview {
    GeometryReader { geometry in
        ResultSection(viewModel: .preview(), geometry: geometry)
    }
}
