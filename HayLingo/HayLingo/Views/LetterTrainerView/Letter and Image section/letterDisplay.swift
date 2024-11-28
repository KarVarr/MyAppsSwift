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
                        .font(.system(size: 72))
                        .bold()
                    Text(viewModel.currentLetter)
                        .font(.system(size: 48))
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
                    maxWidth: geometry.size.width / 7,
                    maxHeight: geometry.size.height / 7
                )
                .padding()
        }
    }
}

#Preview {
    letterDisplay(viewModel: LettersTrainerViewModel())
}
