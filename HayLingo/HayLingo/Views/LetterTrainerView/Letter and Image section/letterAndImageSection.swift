//
//  letterAndImageSection.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct letterAndImageSection: View {
    var viewModel: LettersTrainerViewModel
    var geometry: GeometryProxy
    
    var body: some View {
        HStack {
            letterDisplay(viewModel: viewModel)
            Spacer()
            imageAndDescriptionView(viewModel: viewModel)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Helper.ColorHex.white)
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 4, y: 4)
        }
    }
}

#Preview {
    GeometryReader { geometry in
        letterAndImageSection(viewModel: LettersTrainerViewModel(), geometry: geometry)
    }
}
