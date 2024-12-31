//
//  ResultSection.swift
//  HayLingo
//
//  Created by Karen Vardanian on 27.11.2024.
//

import SwiftUI
import SwiftData

struct ResultSection: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.modelContext) var context
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var settingsManager = BaseSettingsManager.shared
//    @EnvironmentObject var themeManager: ThemeManager
    
    @Query var userData: [UserData]
    @ObservedObject var viewModel: LettersTrainerViewModel
    var geometry: GeometryProxy
    
    @State private var isConfettiActive = false
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    resultTitle()
                    if !viewModel.wrongAnswers.isEmpty {
                        wrongLettersView()
                    }
                    resultDescription()
                    playAgainButton(geometry: geometry)
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(
                            Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.white, dark: Helper.ColorHex.black, themeManager: settingsManager, colorScheme: colorScheme)
                        )
                        .shadow(
                            color: Helper.ThemeColorManager.setColorInDarkMode(
                                light: .gray.opacity(0.4),
                                dark: .black.opacity(0.4),
                                themeManager: settingsManager,
                                colorScheme: colorScheme
                            ),
                            radius: 5,
                            x: 4,
                            y: 4
                        )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(
                Helper.ThemeColorManager.setColorInDarkMode(
                    light: Helper.ColorHex.backgroundLightGray,
                    dark: Helper.ColorHex.backgroundDarkGray,
                    themeManager: settingsManager,
                    colorScheme: colorScheme
                )
            )
            
            if isConfettiActive {
                GeometryReader { geometry in
                    ZStack {
                        ForEach(0..<50) { index in
                            ConfettiParticle(
                                containerSize: geometry.size,
                                startIndex: index
                            )
                        }
                    }
                }
                .allowsHitTesting(false)
                .ignoresSafeArea()
            }
        }
        .onAppear {
            if viewModel.score == viewModel.selectedLetters.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    withAnimation {
                        isConfettiActive = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            isConfettiActive = false
                        }
                    }
                }
            }
        }
    }
    
    
    private func resultTitle() -> some View {
        Text(
            viewModel.score == viewModel.selectedLetters.count
            ? "Great!"
            :  "You answered these letters incorrectly. Please repeat them:"

        )
        .foregroundStyle(
            Helper.ThemeColorManager.setColorInDarkMode(
                light: Helper.ColorHex.darkBlue,
                dark: Helper.ColorHex.lightOrange,
                themeManager: settingsManager,
                colorScheme: colorScheme
            )
        )
        .dynamicTypeSize(.small)
    }
    
    private func wrongLettersView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(viewModel.wrongAnswers.joined(separator: ", "))
                .font(.title)
                .bold()
                .foregroundStyle(
                    Helper.ThemeColorManager.setColorInDarkMode(
                        light: Helper.ColorHex.darkBlue,
                        dark: Helper.ColorHex.lightOrange,
                        themeManager: settingsManager,
                        colorScheme: colorScheme
                    )
                )
        }
        .padding()
    }
    
    private func resultDescription() -> some View {
        Group {
            Text("Your progress: \(viewModel.score) from \(viewModel.selectedLetters.count)")
                .fontWeight(.light)
                .padding()
            
            Text(
                viewModel.score == viewModel.selectedLetters.count
                ? "All letters are correct!"
                : "Don't give up, you will definitely succeed!"
            )
            .fontWeight(.regular)
        }
        .foregroundStyle(
            Helper.ThemeColorManager.setColorInDarkMode(
                light: Helper.ColorHex.darkBlue,
                dark: Helper.ColorHex.lightOrange,
                themeManager: settingsManager,
                colorScheme: colorScheme
            )
        )
    }
    
    private func playAgainButton(geometry: GeometryProxy) -> some View {
        Button {
            updateUserProgress(correct: viewModel.score, total: viewModel.selectedLetters.count, language: viewModel.selectedLanguage)
            Helper.SoundClick.triggerSound(userData: userData)
            Helper.Haptic.triggerVibration(
                userData: userData,
                style: .light
            )
            viewModel.playAgain()
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Play again!")
                .font(.title)
                .dynamicTypeSize(.medium ... .xxxLarge)
                .foregroundStyle(Helper.ColorHex.white)
                .frame(maxWidth: geometry.size.width, maxHeight: 100)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Helper.ColorHex.blue)
                }
                .padding()
        }
    }
    
    private func updateUserProgress(correct: Int, total: Int, language: String) {
        if let user = userData.first {
            let newProgress = ProgressData(language: language, correctAnswer: correct, totalQuestion: total)
            user.progress.append(newProgress)
            try? context.save()
        }
    }
}

#Preview {
    GeometryReader { geometry in
        ResultSection(viewModel: .preview(), geometry: geometry)
            .environmentObject(ThemeManager())
    }
}
