//
//  CollectionView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI
import SwiftData



struct CollectionView: View {
    @ObservedObject var viewModel: LettersTrainerViewModel
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    @Binding var selectedLetters: [String]
    @State private var pressedLetterId: Int? = nil
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    private var selectedLanguage: String {
        userData.first?.selectedLanguage ?? "Russian"
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<AllLetters.armenianAlphabet.count, id: \.self) { index in
                    
                    let letter = AllLetters.armenianAlphabet[index]
                    let isSelected = selectedLetters.contains(letter)
                    let backgroundColor = isSelected ? Helper.ColorHex.pink : Helper.ColorHex.brightBlue
                    
                    Button(action: {
                        toggleLetterSelection(letter: letter)
                        Helper.SoundClick.triggerSound(userData: userData)
                        Helper.Haptic.triggerVibration(userData: userData, style: .light)
                        print(selectedLetters)
                    }) {
                        CollectionViewCell(
                            backgroundColor: backgroundColor,
                            index: index,
                            firstArmUppercaseLetter: letter,
                            secondArmLowercaseLetter: letter.lowercased(),
                            letterForStudy: selectedLanguage == "Russian" ? AllLetters.russianAlphabet[index] : AllLetters.englishAlphabet[index]
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
                                print("Long press detected on letter: \(letter)")
                                viewModel.playSound(named: letter)
                            }
                    )
                }
            }
            .padding(5)
            .padding(.bottom, 10)
            
        }
    }
    
    private func toggleLetterSelection(letter: String) {
        if selectedLetters.contains(letter) {
            selectedLetters.removeAll { $0 == letter }
        } else {
            selectedLetters.append(letter)
        }
    }
}

#Preview {
    CollectionView(viewModel: .preview(), selectedLetters: .constant(["Ա"]))
        .environmentObject(ThemeManager())
}
