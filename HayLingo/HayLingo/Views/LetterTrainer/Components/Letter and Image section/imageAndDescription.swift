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
                if let imageName = viewModel.imageAndDescription {
                    SVGImageView(
                        imageName: imageName,
                        targetSize: CGSize(width: geo.size.width * 0.8, height: geo.size.width * 0.8)
                    )
                    .padding()
                    .id(imageName)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.3), value: imageName)
                    Text(imageName)
                        .foregroundStyle(.secondary)
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.3), value: imageName)
                }
            }
        }
    }
}

//struct imageAndDescription: View {
//    @ObservedObject var viewModel: LettersTrainerViewModel
//    
//    var body: some View {
//        GeometryReader { geo in
//            VStack {
//                Image(viewModel.imageAndDescription ?? "Արև")
//                    .resizable()
//                    .scaledToFit()
//                    .padding()
//                Text(viewModel.imageAndDescription ?? "Արև")
//                    .foregroundStyle(.secondary)
//            }
//        }
//    }
//}
//
//#Preview {
//    imageAndDescription(viewModel: .preview())
//}
