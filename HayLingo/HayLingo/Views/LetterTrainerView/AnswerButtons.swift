//
//  AnswerButtons.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct AnswerButtons: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var themeManager: ThemeManager
    
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
                        .font(.system(size: geometry.size.width * 0.08))
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
        ? Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.orange.opacity(0.3), dark: Helper.ColorHex.pink.opacity(0.3), themeManager: themeManager, colorScheme: colorScheme)
        : Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.orange, dark: Helper.ColorHex.pink, themeManager: themeManager, colorScheme: colorScheme)
    }
}

#Preview {
    GeometryReader { geometry in
        AnswerButtons(viewModel: .preview(), geometry: geometry)
            .environmentObject(ThemeManager())
    }
}
