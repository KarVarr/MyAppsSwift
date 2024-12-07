//
//  LettersTrainerViewModel.swift
//  HayLingo
//
//  Created by Karen Vardanian on 26.11.2024.
//

import SwiftUI
import SwiftData
import AVFoundation

final class LettersTrainerViewModel: ObservableObject {
    @Environment(\.presentationMode) var presentationMode
    
    @Published var currentLetterIndex = 0
    @Published var score = 0
    @Published var correctAnswer = ""
    @Published var wrongAnswers: [String] = []
    @Published var correctAnswers: [String] = []
    @Published var options: [String] = []
    @Published var showResult = false
    @Published var isCorrect = false
    @Published var areButtonsDisabled = false
    @Published var imageAndDescription: String?
    @Published var selectedAnswer: String?
    @Published var selectedLetters: [String] = []
    @Published var selectedLanguage: String = "Russian"
    
    private let englishTranslations: [String: String]
    private let russianTranslations: [String: String]
    private let animals: [String: [String]]
    private var audioPlayer: AVAudioPlayer?
    
    var currentLetter: String {
        guard currentLetterIndex < selectedLetters.count else { return "" }
        return selectedLetters[currentLetterIndex]
    }
    
    init(userData: [UserData]) {
        self.selectedLanguage = userData.first?.selectedLanguage ?? "Russian"
        self.englishTranslations = Letter.allLetters.reduce(into: [:]) { $0[$1.character] = $1.englishTranslation }
        self.russianTranslations = Letter.allLetters.reduce(into: [:]) { $0[$1.character] = $1.russianTranslation }
        self.animals = Letter.allLetters.reduce(into: [:]) { $0[$1.character] = $1.animals }
    }
    
    func updateLanguage(_ language: String) {
        self.selectedLanguage = language
    }
    
    func setup(with letters: [String]) {
        selectedLetters = letters
        setupQuestion()
    }
    
    
    
    func checkAnswer(selected: String) {
        isCorrect = selected == correctAnswer
        if isCorrect {
            correctAnswers.append(selectedLetters[currentLetterIndex])
            score += 1
            print("score: \(score)")
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
        print("Updated imageAndDescription: \(imageAndDescription ?? "None")")
        
        
        let translations = selectedLanguage == "Russian" ? russianTranslations : englishTranslations
        
        correctAnswer = translations[currentLetter] ?? ""
        
        var wrongOptions = Array(translations.values)
        wrongOptions.removeAll { $0 == correctAnswer }
        wrongOptions.shuffle()
        
        options = Array(wrongOptions.prefix(3))
        options.append(correctAnswer)
        options.shuffle()
        
        showResult = false
    }
    
    private func randomAnimal(_ letter: String) -> String {
        guard let animalsForLetter = animals[letter], !animalsForLetter.isEmpty else {
            print("No animals found for letter: \(letter)")
            return "No image for letter \(letter)"
        }
        let randomAnimal = animalsForLetter.randomElement() ?? "No image"
        print("Random animal for letter \(letter): \(randomAnimal)")
        return randomAnimal
    }

    
    func playAgain() {
        currentLetterIndex = 0
        score = 0
        correctAnswers = []
        wrongAnswers = []
        selectedLetters = [] // Полностью очищаем
        options = []
        selectedAnswer = nil
        showResult = false
        isCorrect = false
        areButtonsDisabled = false
        imageAndDescription = nil
        
        print("Game reset. Current index: \(currentLetterIndex), Score: \(score), Selected Letters: \(selectedLetters)")
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
