//
//  CollectionView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI
import SwiftData

struct CollectionView: View {
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    @Binding var selectedLetters: [String]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    let armenianAlphabet = ["Ա", "Բ", "Գ", "Դ", "Ե", "Զ", "Է", "Ը", "Թ", "Ժ", "Ի", "Լ", "Խ", "Ծ", "Կ", "Հ", "Ձ", "Ղ", "Ճ", "Մ", "Յ", "Ն", "Շ", "Ո", "Չ", "Պ", "Ջ", "Ռ", "Ս", "Վ", "Տ", "Ր", "Ց", "Ու", "Փ", "Ք", "Եվ", "Օ", "Ֆ"]
    //    let armenianAlphabetLowercase = Array(arrayLiteral: "ա", "բ", "գ", "դ", "ե", "զ", "է", "ը", "թ", "ժ", "ի", "լ", "խ", "ծ", "կ", "հ", "ձ", "ղ", "ճ", "մ", "յ", "ն", "շ", "ո", "չ", "պ", "ջ", "ռ", "ս", "վ", "տ", "ր", "ց", "ւ", "փ", "ք", "և", "օ", "ֆ")
    let russianAlphabet = ["а", "б", "г", "д", "е", "з", "э", "ы – э", "т‘", "ж", "и", "л", "х", "тц", "к", "h", "дз", "гх", "тч", "м", "й", "н", "ш", "во", "ч", "п", "дж", "р", "с", "в", "т", "р‘", "ц", "у", "п‘", "к‘", "ев", "о", "ф"]
    let englishAlphabet = ["a", "b", "g", "d", "e", "z", "ē", "ə", "t‘", "ž", "i", "l", "x", "c", "k", "h", "j", "ł", "č", "m", "y", "n", "š", "o", "č‘", "p", "ǰ", "r̄", "s", "v", "t", "r", "c‘", "w", "p‘", "k‘", "ev", "ô", "f"]
    
    var body: some View {
            ScrollView {
                Text("Select letters for practice")
                
                LazyVGrid(columns: columns) {
                    let selectedLanguage = userData.first?.selectedLanguage ?? "Russian"
                    
                    ForEach(0..<armenianAlphabet.count, id: \.self) { index in
                        
                        let letter = armenianAlphabet[index]
                        let isSelected = selectedLetters.contains(letter)
                        let backgroundColor = isSelected ? Helper.ColorHex.orange : Helper.ColorHex.lightGray
                        
                        
                        Button(action: {
                            toggleLetterSelection(letter: letter)
                            print(selectedLetters)
                        }) {
                            CollectionViewCell(
                                backgroundColor: backgroundColor,
                                index: index,
                                firstArmUppercaseLetter: letter,
                                secondArmLowercaseLetter: letter.lowercased(),
                                letterForStudy: selectedLanguage == "Russian" ? russianAlphabet[index] : englishAlphabet[index]
                            )
                        }
                    }
                }
                .padding(10)
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
        CollectionView(selectedLetters: .constant(["Ա"]))
    }
