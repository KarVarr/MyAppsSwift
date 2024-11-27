//
//  letterDisplay.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct letterDisplay: View {
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
}

#Preview {
    letterDisplay()
}
