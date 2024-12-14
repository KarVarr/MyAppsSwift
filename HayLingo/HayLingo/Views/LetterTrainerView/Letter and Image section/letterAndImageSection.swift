//
//  letterAndImageSection.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct letterAndImageSection: View {
    @ObservedObject var viewModel: LettersTrainerViewModel
    var geometry: GeometryProxy
    
    var body: some View {
        HStack(spacing: 10) {
            letterDisplay(viewModel: viewModel)
//                .frame(width: geometry.size.width * 0.4)
            Spacer()
            imageAndDescriptionView(viewModel: viewModel)
//                .frame(width: geometry.size.width * 0.5)
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
        letterAndImageSection(viewModel: .preview(), geometry: geometry)
    }
}
