//
//  imageAndDescription.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct imageAndDescription: View {
    @ObservedObject var viewModel: LettersTrainerViewModel
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(viewModel.imageAndDescription ?? "Արև")
                    .resizable()
                    .scaledToFit()
                    .padding()
                Text(viewModel.imageAndDescription ?? "Արև")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    imageAndDescription(viewModel: .preview())
}
