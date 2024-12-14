//
//  AnswerButtons.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct AnswerButtons: View {
    var viewModel: LettersTrainerViewModel
    var geometry: GeometryProxy
    
    var body: some View {
        
        VStack(spacing: 10) {
            ForEach(viewModel.options, id: \.self) { option in
                Button {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        viewModel.selectedAnswer = option
                        viewModel.checkAnswer(selected: option)
                    }
                } label: {
                    Text(option)
                        .font(.system(size: geometry.size.width * 0.05))
                        .bold()
                        .foregroundStyle(Helper.ColorHex.white)
                        .padding()
                        .frame(
                            maxWidth: geometry.size.width * 0.9,
                            minHeight: geometry.size.height * 0.08,
                            alignment: .center
                        )
                    
                        .background(
                            answerButtonBackground(for: option)
                        )
                        .animation(.easeInOut(duration: 0.3), value: viewModel.selectedAnswer)
                        .animation(.easeInOut(duration: 0.3), value: viewModel.showResult)
                        .animation(.easeInOut(duration: 0.3), value: viewModel.areButtonsDisabled)
                        .cornerRadius(10)
                }
                .disabled(viewModel.areButtonsDisabled)
            }
        }
        .padding(.horizontal, 5)
    }
    
    private func answerButtonBackground(for option: String) -> Color {
        if viewModel.selectedAnswer == option && viewModel.showResult {
            return viewModel.isCorrect ? .green : .red
        }
        return viewModel.areButtonsDisabled
        ? Helper.ColorHex.orange.opacity(0.5)
        : Helper.ColorHex.orange
    }
}

#Preview {
    GeometryReader { geometry in
        AnswerButtons(viewModel: .preview(), geometry: geometry)
    }
}
