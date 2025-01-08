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
    // MARK: - Properties
    @Query private var userData: [UserData]
    private let settingsManager: BaseSettingsManager
    
    // MARK: - Published Properties
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
    @Published var selectedLanguage: String
    @Published var isSoundEnabled: Bool
    @Published var isVibrationEnabled: Bool
    
    private let englishTranslations: [String: String]
    private let russianTranslations: [String: String]
    private let animals: [String: [String]]
    private var audioPlayer: AVAudioPlayer?
    
    var currentLetter: String {
        guard currentLetterIndex < selectedLetters.count else { return "" }
        return selectedLetters[currentLetterIndex]
    }
    
    init(userData: [UserData]) {
        self.settingsManager = BaseSettingsManager.shared
        let user = userData.first
        
        self.selectedLanguage = settingsManager.currentLanguage.rawValue
        self.isSoundEnabled = (user?.selectedSound ?? "on") == "on"
        self.isVibrationEnabled = (user?.selectedVibration ?? "on") == "on"
        
        self.englishTranslations = Letter.allLetters.reduce(into: [:]) { $0[$1.character] = $1.englishTranslation }
        self.russianTranslations = Letter.allLetters.reduce(into: [:]) { $0[$1.character] = $1.russianTranslation }
        self.animals = Letter.allLetters.reduce(into: [:]) { $0[$1.character] = $1.animals }
        
        setupNotifications()
    }
    
    private func setupNotifications() {
        NotificationCenter.default.addObserver(forName: .soundSettingsDidChange, object: nil, queue: .main) { [weak self] _ in
            self?.handleSettingsChange()
        }
        
        NotificationCenter.default.addObserver(forName: .vibrationSettingsDidChange, object: nil, queue: .main) { [weak self] _ in
            self?.handleSettingsChange()
        }
        
        NotificationCenter.default.addObserver(forName: .languageDidChange, object: nil, queue: .main) { [weak self] _ in
            self?.handleSettingsChange()
        }
    }
    
    private func handleSettingsChange() {
        guard let userData = userData.first else { return }
        
        selectedLanguage = AppLanguage(rawValue: userData.selectedLanguage)?.localizedString ?? AppLanguage.russian.localizedString
        isSoundEnabled = AppSound(rawValue: userData.selectedSound)?.rawValue == AppSound.on.rawValue
        isVibrationEnabled = AppVibration(rawValue: userData.selectedVibration)?.rawValue == AppVibration.on.rawValue
        
        setupQuestion()
    }
    
    func updateLanguage(_ language: String) {
        self.selectedLanguage = language
        setupQuestion()
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
        } else {
            wrongAnswers.append(selectedLetters[currentLetterIndex])
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
        
        
        let currentLanguage = settingsManager.currentLanguage
        let translations = currentLanguage == .russian ? russianTranslations : englishTranslations
        
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
        selectedLetters = []
        options = []
        selectedAnswer = nil
        showResult = false
        isCorrect = false
        areButtonsDisabled = false
        imageAndDescription = nil
        
        print("Game reset. Current index: \(currentLetterIndex), Score: \(score), Selected Letters: \(selectedLetters)")
    }
    
    func playSound(named soundName: String) {
        // убери комментарий с guard, если надо убрать звук буквы вместе со звуком приложения
//        guard settingsManager.isSoundEnabled else { return }
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
    
    func vibrate() {
        guard settingsManager.isVibrationEnabled else { return }
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}
