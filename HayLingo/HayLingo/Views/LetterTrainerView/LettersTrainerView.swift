//
//  LettersTrainerView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 16.11.2024.
//

import SwiftUI
import SwiftData
import AVFoundation

struct LettersTrainerView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var context
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var settingsManager = BaseSettingsManager.shared
    @EnvironmentObject var themeManager: ThemeManager
    @Query var userData: [UserData]
    
    @Binding var selectedLetters: [String]
    @StateObject private var viewModel = LettersTrainerViewModel(userData: [UserData]())
    
    init(selectedLetters: Binding<[String]>) {
        self._selectedLetters = selectedLetters
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                if viewModel.currentLetterIndex < viewModel.selectedLetters.count {
                    CustomProgressView(viewModel: viewModel)
                    letterAndImageSection(viewModel: viewModel, geometry: geometry)
                    
                    
                    Text("Choose the correct translation:")
                        .font(.system(size: geometry.size.width * 0.03, weight: .light))
                        .padding()
                    AnswerButtons(viewModel: viewModel, geometry: geometry)
                } else {
                    ResultSection(viewModel: viewModel, geometry: geometry)
                }
            }
            .padding()
            .onAppear {
                if let firstUserData = userData.first {
                    viewModel.updateLanguage(firstUserData.selectedLanguage)
                    viewModel.setup(with: selectedLetters)
                }
            }
            .navigationBarBackButtonHidden(viewModel.currentLetterIndex >= viewModel.selectedLetters.count)
        }
        .background(
            Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.backgroundLightGray, dark: Helper.ColorHex.backgroundDarkGray, themeManager: settingsManager, colorScheme: colorScheme)
        )
    }
}
#Preview {
    LettersTrainerView(selectedLetters: .constant(["Ու","Ե", "Ու", "Գ"]))
        .environmentObject(ThemeManager())
}
