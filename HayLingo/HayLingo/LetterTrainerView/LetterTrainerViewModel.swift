//
//  LetterTrainerViewModel.swift
//  HayLingo
//
//  Created by Karen Vardanian on 14.11.2024.
//

import Combine
import Foundation
import SwiftData
import SwiftUI

class LetterTrainerViewModel: ObservableObject {
    @Published var currentLetter: String = ""
    @Published var currentImage: String = ""
    @Published var answerChoices: [String] = []
    @Published var selectedChoice: String?
    @Published var progress: [ProgressData] = []
    @Published var selectedLetters: [String] = []
    
    private var currentIndex = 0
    
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    
    func startTraining(selectedLetters: [String]) {
        self.selectedLetters = selectedLetters
        currentIndex = 0
        loadNextLetter()
    }
    
    private func loadNextLetter() {
        if currentIndex < selectedLetters.count {
            let letter = selectedLetters[currentIndex]
            currentLetter = letter
            currentImage = getImageName(for: letter)
            answerChoices = generateAnswerChoices(for: letter)
            currentIndex += 1
        } else {
            saveProgress()
        }
    }
    
    private func generateAnswerChoices(for letter: String) -> [String] {
        let correctAnswer = getLanguageEquivalent(for: letter)
        var choices = [correctAnswer]
        while choices.count < 4 {
            let distractor = getRandomLanguageEquivalent()
            if !choices.contains(distractor) {
                choices.append(distractor)
            }
        }
        choices.shuffle()
        return choices
    }
    
    func checkAnswer(_ choice: String) {
        let isCorrect = choice == getLanguageEquivalent(for: currentLetter)
        updateProgress(isCorrect: isCorrect)
        selectedChoice = nil
        loadNextLetter()
    }
    
    private func updateProgress(isCorrect: Bool) {
        if let user = userData.first {
            if let progressData = user.progress.first(where: { $0.language == user.selectedLanguage }) {
                progressData.totalQuestion += 1
                if isCorrect {
                    progressData.correctAnswer += 1
                }
            } else {
                let newProgressData = ProgressData(
                    language: user.selectedLanguage,
                    correctAnswer: isCorrect ? 1 : 0,
                    totalQuestion: 1
                )
                user.progress.append(newProgressData)
            }
            
            do {
                try context.save()
            } catch {
                print("Error saving progress: \(error)")
            }
        }
    }
    
    private func saveProgress() {
        // TODO: Implement saving the overall progress
    }
    
    private func getImageName(for letter: String) -> String {
        return "image_\(letter)"
    }
    
    private func getLanguageEquivalent(for letter: String) -> String {
        if let user = userData.first {
            switch user.selectedLanguage {
            case "Russian":
                return russianAlphabet[armenianAlphabet.firstIndex(of: letter) ?? 0]
            case "English":
                return englishAlphabet[armenianAlphabet.firstIndex(of: letter) ?? 0]
            default:
                return ""
            }
        }
        return ""
    }
    
    private func getRandomLanguageEquivalent() -> String {
        if let user = userData.first {
            switch user.selectedLanguage {
            case "Russian":
                let index = Int.random(in: 0..<russianAlphabet.count)
                return russianAlphabet[index]
            case "English":
                let index = Int.random(in: 0..<englishAlphabet.count)
                return englishAlphabet[index]
            default:
                return ""
            }
        }
        return ""
    }
    
    private let armenianAlphabet = ["Ա", "Բ", "Գ", "Դ", "Ե", "Զ", "Է", "Ը", "Թ", "Ժ", "Ի", "Լ", "Խ", "Ծ", "Կ", "Հ", "Ձ", "Ղ", "Ճ", "Մ", "Յ", "Ն", "Շ", "Ո", "Չ", "Պ", "Ջ", "Ռ", "Ս", "Վ", "Տ", "Ր", "Ց", "Ու", "Փ", "Ք", "Եվ", "Օ", "Ֆ"]
    private let russianAlphabet = ["а", "б", "г", "д", "е", "з", "э", "ы – э", "т'", "ж", "и", "л", "х", "тц", "к", "h", "дз", "гх", "тч", "м", "й", "н", "ш", "во", "ч", "п", "дж", "р", "с", "в", "т", "р'", "ц", "у", "п'", "к'", "ев", "о", "ф"]
    private let englishAlphabet = ["a", "b", "g", "d", "e", "z", "ē", "ə", "t'", "ž", "i", "l", "x", "c", "k", "h", "j", "ł", "č", "m", "y", "n", "š", "o", "č'", "p", "ǰ", "r̄", "s", "v", "t", "r", "c'", "w", "p'", "k'", "ev", "ô", "f"]
}
