//
//  letterDisplay.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct letterDisplay: View {
    @ObservedObject var viewModel: LettersTrainerViewModel
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                HStack {
                    Text(viewModel.currentLetter)
                        .font(.system(size: geo.size.width * 0.55))
                        .minimumScaleFactor(0.5)
                        .bold()
                    Text(viewModel.currentLetter)
                        .font(.system(size: geo.size.width * 0.25))
                        .minimumScaleFactor(0.5)
                        .fontWeight(.light)
                }
                .frame(maxWidth: geo.size.width, maxHeight: geo.size.height / 4)
                .padding()
                
                soundPlayButton(geometry: geo)
            }
        }
    }
    
    private func soundPlayButton(geometry: GeometryProxy) -> some View {
        Button {
            viewModel.playSound(named: viewModel.currentLetter)
        } label: {
            Image(systemName: "volume.2")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.secondary)
                .frame(
                    width: geometry.size.width * 0.2,
                    height: geometry.size.width * 0.2
                )
                .padding()
        }
    }
}

#Preview {
    letterDisplay(viewModel: .preview())
}
