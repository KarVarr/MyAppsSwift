//
//  CollectionView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI
import SwiftData

struct CollectionView: View {
    @StateObject private var settingsManager = BaseSettingsManager.shared
    @State private var currentLanguage: AppLanguage = .russian
    @ObservedObject var viewModel: LettersTrainerViewModel
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    @Binding var selectedLetters: [String]
    @State private var pressedLetterId: Int? = nil
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    private var selectedLanguage: String {
        return BaseSettingsManager.shared.currentLanguage.rawValue
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<AllLetters.armenianAlphabet.count, id: \.self) { index in
                    let letter = AllLetters.armenianAlphabet[index]
                    let isLastLetter = index == AllLetters.armenianAlphabet.count - 1
                    let isSelected = isLastLetter ?
                        selectedLetters.count == AllLetters.armenianAlphabet.count - 1 :
                        selectedLetters.contains(letter)
                    let backgroundColor = isSelected ? Helper.ColorHex.pink : Helper.ColorHex.brightBlue
                    
                    Button(action: {
                        if isLastLetter {
                            toggleAllLetters()
                        } else {
                            toggleLetterSelection(letter: letter)
                        }
                        Helper.Haptic.triggerVibration(userData: userData, style: .light)
                        print(selectedLetters)
                    }) {
                        CollectionViewCell(
                            backgroundColor: backgroundColor,
                            index: index,
                            firstArmUppercaseLetter: letter,
                            secondArmLowercaseLetter: isLastLetter ? nil : letter.lowercased(),
                            letterForStudy: currentLanguage == .russian ?
                                AllLetters.russianAlphabet[index] :
                                AllLetters.englishAlphabet[index]
                        )
                        .scaleEffect(pressedLetterId == index ? 0.9 : 1.0)
                        .animation(.easeInOut(duration: 0.2), value: pressedLetterId)
                    }
                    .simultaneousGesture(
                        LongPressGesture(minimumDuration: 0.5)
                            .onChanged { _ in
                                pressedLetterId = index
                            }
                            .onEnded { _ in
                                pressedLetterId = nil
                                if !isLastLetter {
                                    print("Long press detected on letter: \(letter)")
                                    viewModel.playSound(named: letter)
                                }
                            }
                    )
                }
            }
            .padding(5)
            .padding(.bottom, 10)
        }
        .onReceive(NotificationCenter.default.publisher(for: .languageDidChange)) { _ in
            currentLanguage = settingsManager.currentLanguage
        }
        .onAppear {
            currentLanguage = settingsManager.currentLanguage
        }
    }
    
    private func toggleLetterSelection(letter: String) {
        if selectedLetters.contains(letter) {
            selectedLetters.removeAll { $0 == letter }
        } else {
            selectedLetters.append(letter)
        }
    }
    
    private func toggleAllLetters() {
        let allLettersExceptLast = Array(AllLetters.armenianAlphabet.dropLast())
        if selectedLetters.count == allLettersExceptLast.count {
            selectedLetters.removeAll()
        } else {
            selectedLetters = allLettersExceptLast
        }
    }
}

#Preview {
    CollectionView(viewModel: .preview(), selectedLetters: .constant(["Ա"]))
        .environmentObject(ThemeManager())
}
