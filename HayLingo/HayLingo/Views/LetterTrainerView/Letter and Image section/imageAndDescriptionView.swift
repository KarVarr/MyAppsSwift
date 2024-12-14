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
        GeometryReader { geo in
            VStack {
                Image(viewModel.imageAndDescription ?? "Արև")
                    .resizable()
                    .scaledToFit()
                    .frame(height: geo.size.height * 0.6)
                Text(viewModel.imageAndDescription ?? "Արև")
                    .font(.system(size: geo.size.width * 0.1))
                    .foregroundStyle(.secondary)
            }
        }
    }}

#Preview {
    imageAndDescriptionView(viewModel: .preview())
}
