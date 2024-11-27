//
//  LettersTrainerViewModel.swift
//  HayLingo
//
//  Created by Karen Vardanian on 26.11.2024.
//

import SwiftUI
import AVFoundation


final class LettersTrainerViewModel: ObservableObject {
    
    @Published var currentLetterIndex = 0
    @Published var score = 0
    @Published var correctAnswer = ""
    @Published var wrongAnswers: [String] = []
    @Published var options: [String] = []
    @Published var showResult = false
    @Published var isCorrect = false
    @Published var areButtonsDisabled = false
    @Published var imageAndDescription: String?
    @Published var selectedAnswer: String?
    
    @Published var selectedLetters: [String] = []
    @Published private var audioPlayer: AVAudioPlayer?
    
    
    func setup(with letters: [String]) {
        selectedLetters = letters
        setupQuestion()
    }
    
    
    func checkAnswer(selected: String) {
        isCorrect = selected == correctAnswer
        if isCorrect {
            score += 1
            UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
        } else {
            wrongAnswers.append(selectedLetters[currentLetterIndex])
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        }
        
        withAnimation(.easeInOut(duration: 0.3)) {
            areButtonsDisabled = true
            showResult = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 0.3)) {
                self.currentLetterIndex += 1
                if self.currentLetterIndex < self.selectedLetters.count {
                    self.setupQuestion()
                }
                self.areButtonsDisabled = false
            }
        }
    }
    
    
    func setupQuestion() {
        guard currentLetterIndex < selectedLetters.count else { return }
        
        selectedAnswer = nil
        let currentLetter = selectedLetters[currentLetterIndex]
        imageAndDescription = randomAnimal(currentLetter)
        
        let multiAnswer = userData.first?.selectedLanguage
        correctAnswer = multiAnswer == "Russian" ? russianTranslations[currentLetter] ?? "" : englishTranslations[currentLetter] ?? ""
        
        var wrongOptions = multiAnswer == "Russian" ? Array(russianTranslations.values) : Array(englishTranslations.values)
        wrongOptions.removeAll {$0 == correctAnswer}
        wrongOptions.shuffle()
        
        options = Array(wrongOptions.prefix(3))
        options.append(correctAnswer)
        options.shuffle()
        
        showResult = false
    }
    
    private func randomAnimal(_ letter: String) -> String {
        
        return animals[letter]?.randomElement()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "нет этой картинки\(String(describing: animals[letter]?.randomElement()))"
    }
    
    func playAgain() {
        selectedLetters = []
        presentationMode.wrappedValue.dismiss()
    }
    
    func playSound(named soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Sound file \(soundName).mp3 not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }

    
}
