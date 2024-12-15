//
//  letterAndImageSection.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI

struct letterAndImageSection: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var themeManager: ThemeManager
    @ObservedObject var viewModel: LettersTrainerViewModel
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(alignment: .center, spacing: geometry.size.width * 0.1) {
            HStack(alignment: .center, spacing: geometry.size.width * 0.1) {
                lettersAndVolume(viewModel: viewModel)
                    .frame(width: geometry.size.width * 0.4, height: geometry.size.height / 4)
                imageAndDescription(viewModel: viewModel)
                    .frame(width: geometry.size.width * 0.4, height: geometry.size.height / 4)
            }
            .frame(minWidth: geometry.size.width * 0.8, maxWidth: geometry.size.width * 0.9, minHeight: geometry.size.height / 4, maxHeight: geometry.size.height / 3)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.white, dark: Helper.ColorHex.black, themeManager: themeManager, colorScheme: colorScheme)
                )
                .shadow(
                    color: Helper.ThemeColorManager.setColorInDarkMode(
                        light: .gray.opacity(0.4),
                        dark: .black.opacity(0.4),
                        themeManager: themeManager,
                        colorScheme: colorScheme
                    ),
                    radius: 5,
                    x: 4,
                    y: 4
                )
        }
    }
}

#Preview {
    GeometryReader { geometry in
        letterAndImageSection(viewModel: .preview(), geometry: geometry)
            .previewLayout(.sizeThatFits)
            .frame(minWidth: geometry.size.width * 0.8, maxWidth: geometry.size.width * 0.9, minHeight: geometry.size.height / 5, maxHeight: geometry.size.height / 4)
            .padding()
            .background(Color.gray.opacity(0.1))
            .environmentObject(ThemeManager())
    }
}
