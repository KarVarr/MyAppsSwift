//
//  LettersView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI
import SwiftData

struct LettersView: View {
    @Environment(\.modelContext) var context
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var themeManager: ThemeManager
    
    @Query var userData: [UserData]
    
    @State private var selectedLetters: [String] = []
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Select letters for practice")
                        .font(.title)
                        .foregroundStyle(Helper.ColorHex.darkGray)
                        .padding(.top)
                    
                    CollectionView(viewModel: .preview(), selectedLetters: $selectedLetters)
                    VStack(spacing: 16) {
                        if selectedLetters.isEmpty {
                            Text("Please select letters!")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Helper.ColorHex.darkGray)
                                .padding(.bottom, 8)
                        } else {
                            Text("Now you can train!")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Helper.ColorHex.darkGray)
                                .padding(.bottom, 8)
                        }
                        
                        NavigationLink(destination: LettersTrainerView(selectedLetters: $selectedLetters)
                            .onAppear {
                                selectedLetters = []
                            }) {
                                Text("Start game")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(selectedLetters.isEmpty ? .gray : .white)
                                    .padding()
                                    .frame(width: 270, height: 70)
                                    .background {
                                        RoundedRectangle(cornerRadius: 35, style: .continuous)
                                            .fill(selectedLetters.isEmpty ? Helper.ColorHex.lightGray : Helper.ColorHex.orange)
                                    }
                            }
                            .disabled(selectedLetters.isEmpty)
                            .simultaneousGesture(TapGesture().onEnded({
                                if !selectedLetters.isEmpty {
                                    Helper.SoundClick.triggerSound(userData: userData)
                                    Helper.Haptic.triggerVibration(userData: userData, style: .light)
                                }
                            }))
                    }
                    .padding()
                }
            }
            .background(Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.backgroundLightGray, dark: Helper.ColorHex.backgroundDarkGray, themeManager: themeManager, colorScheme: colorScheme))
            .toolbarBackground(Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.backgroundLightGray, dark: Helper.ColorHex.backgroundDarkGray, themeManager: themeManager, colorScheme: colorScheme), for: .navigationBar)
        }
    }
}

#Preview {
    LettersView()
        .environmentObject(ThemeManager())
}


