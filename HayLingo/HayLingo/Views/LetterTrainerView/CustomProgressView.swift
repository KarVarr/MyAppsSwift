//
//  CustomProgressView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct CustomProgressView: View {
    @ObservedObject var viewModel: LettersTrainerViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Result: \(viewModel.score) of \(viewModel.selectedLetters.count)")
                .font(.headline)
                .padding(.bottom, 3)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 1, style: .continuous)
                        .frame(height: 3)
                    
                    HStack(spacing: 0) {
                        ForEach(0..<viewModel.selectedLetters.count, id: \.self) { index in
                            let isCorrect = viewModel.correctAnswers.contains(viewModel.selectedLetters[index])
                            let isIncorrect = viewModel.wrongAnswers.contains(viewModel.selectedLetters[index])
                            let targetWidth = isCorrect || isIncorrect ? geometry.size.width / CGFloat(viewModel.selectedLetters.count) : 0
                            
                            RoundedRectangle(cornerRadius: 0.1, style: .continuous)
                                .fill(
                                    isCorrect ? .green :
                                        isIncorrect ? .red :
                                        Helper.ColorHex.lightGray
                                )
                                .frame(
                                    width: targetWidth,
                                    height: 3
                                )
                                .animation(.easeInOut(duration: 0.5), value: targetWidth)
                        }
                    }
                }
            }
            .frame(height: 20)
        }
        .padding(2)
    }
}

#Preview {
    CustomProgressView(viewModel: .preview())
}
