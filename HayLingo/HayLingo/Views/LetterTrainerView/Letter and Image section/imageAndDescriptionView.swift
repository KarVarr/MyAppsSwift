//
//  imageAndDescriptionView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct imageAndDescriptionView: View {
    @ObservedObject var viewModel: LettersTrainerViewModel
    
    var body: some View {
        VStack {
            Image(viewModel.imageAndDescription ?? "Արև")
                .resizable()
                .scaledToFit()
            Text(viewModel.imageAndDescription ?? "Արև")
                .font(.title2)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    imageAndDescriptionView(viewModel: .preview())
}
