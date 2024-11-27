//
//  CustomProgressView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct CustomProgressView: View {
    var viewModel: LettersTrainerViewModel
    
    var body: some View {
        ProgressView(
            value: Float(viewModel.score),
            total: Float(viewModel.selectedLetters.count)
        ) {
        } currentValueLabel: {
            Text("Верных ответов: \(viewModel.score) из \(viewModel.selectedLetters.count)")
        }
        .tint(Helper.ColorHex.orange)
    }
}

#Preview {
    CustomProgressView(viewModel: LettersTrainerViewModel())
}
