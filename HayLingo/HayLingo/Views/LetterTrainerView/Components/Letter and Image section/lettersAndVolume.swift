//
//  lettersAndVolume.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct lettersAndVolume: View {
    @ObservedObject var viewModel: LettersTrainerViewModel
    @StateObject private var settingsManager = BaseSettingsManager.shared
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center, spacing: geo.size.width * 0.1) {
                Spacer()
                HStack(alignment: .center, spacing: geo.size.width * 0.05) {
                    Text(viewModel.currentLetter)
                        .font(.system(size: geo.size.width * 0.5))
                        .minimumScaleFactor(0.5)
                        .bold()
                    Text(viewModel.currentLetter.lowercased())
                        .font(.system(size: geo.size.width * 0.3))
                        .minimumScaleFactor(0.5)
                        .fontWeight(.light)
                }
                .foregroundStyle(Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.black, dark: Helper.ColorHex.white, themeManager: settingsManager, colorScheme: colorScheme))
                .frame(maxWidth: .infinity)
                
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
                .foregroundStyle(Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.orange, dark: Helper.ColorHex.pink, themeManager: settingsManager, colorScheme: colorScheme))
                .frame(
                    width: geometry.size.width * 0.16,
                    height: geometry.size.width * 0.16
                )
                .padding()
        }
    }
}

#Preview {
    lettersAndVolume(viewModel: .preview())
        .environmentObject(ThemeManager())
}
