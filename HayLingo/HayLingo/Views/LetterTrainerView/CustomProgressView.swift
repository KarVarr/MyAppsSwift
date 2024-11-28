//
//  CustomProgressView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct CustomProgressView: View {
    @ObservedObject var viewModel: LettersTrainerViewModel
    
    //    var body: some View {
    //        ProgressView(
    //            value: Float(viewModel.score),
    //            total: Float(viewModel.selectedLetters.count)
    //        ) {
    //        } currentValueLabel: {
    //            Text("Верных ответов: \(viewModel.score) из \(viewModel.selectedLetters.count)")
    //        }
    //        .tint(Helper.ColorHex.orange)
    //    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Результат: \(viewModel.score) из \(viewModel.selectedLetters.count)")
                .font(.headline)
                .padding(.bottom, 4)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Фон прогресс-бара
                    RoundedRectangle(cornerRadius: 1, style: .continuous)
                    //                        .fill(Helper.ColorHex.lightGray)
                        .frame(height: 3)
                    
                    // Сегменты для каждого ответа
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
                            //                            RoundedRectangle(cornerRadius: 0.3, style: .continuous)
                            //                                .fill(
                            //                                    isCorrect ? .green :
                            //                                    isIncorrect ? Helper.ColorHex.red :
                            //                                    Helper.ColorHex.lightGray
                            //                                )
                            //                                .frame(
                            //                                    width: geometry.size.width / CGFloat(viewModel.selectedLetters.count),
                            //                                    height: 3
                            //                                )
                            //                                .animation(.spring(response: 0.5, dampingFraction: 0.6), value: geometry.size.width)
                            //                                .animation(.easeInOut(duration: 0.3), value: isCorrect || isIncorrect)
                        }
                    }
                }
            }
            .frame(height: 20)
        }
        .padding()
    }
}

#Preview {
    CustomProgressView(viewModel: LettersTrainerViewModel())
}
