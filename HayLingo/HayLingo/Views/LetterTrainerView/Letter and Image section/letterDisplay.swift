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
                        .minimumScaleFactor(0.5)
                        .bold()
                    Text(viewModel.currentLetter)
                        .font(.system(size: 48))
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
                    minWidth: geometry.size.width / 10,
                    maxWidth: geometry.size.width / 7,
                    minHeight: geometry.size.height / 10,
                    maxHeight: geometry.size.height / 7
                )
                
                .padding()
        }
    }
}

#Preview {
    letterDisplay(viewModel: .preview())
}
