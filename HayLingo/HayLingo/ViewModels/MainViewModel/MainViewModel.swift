//
//  MainViewModel.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI
import SwiftData

class MainViewModel: ObservableObject {
    let context: ModelContext
    private let settingsManager: BaseSettingsManager
    
    @Published var userData: [UserData] = []
    @Published var isSettingsTapEnabled = true
    @Published var isInfoViewPresented = false
    @Published var showSettings = false
    @Published var selectedLanguage: String = "Russian"
    @Published var count = 0
    
    init(context: ModelContext, settingsManager: BaseSettingsManager = .shared) {
        self.context = context
        self.settingsManager = settingsManager
        
        loadInitialData()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(refreshUserData),
            name: .progressDataDidChange,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func loadInitialData() {
        let descriptor = FetchDescriptor<UserData>()
        userData = (try? context.fetch(descriptor)) ?? []
        
        if userData.isEmpty {
            let newUser = UserData(
                id: UUID(),
                name: "Misha",
                selectedLanguage: settingsManager.currentLanguage.rawValue,
                selectedTheme: settingsManager.currentTheme.rawValue,
                selectedSound: AppSound.on.rawValue,
                selectedVibration: AppVibration.on.rawValue,
                progress: []
            )
            context.insert(newUser)
            try? context.save()
            userData = [newUser]
        }
    }
    
    @objc func refreshUserData() {
        let descriptor = FetchDescriptor<UserData>()
        userData = (try? context.fetch(descriptor)) ?? []
        objectWillChange.send()
    }
    
    var latestProgress: String {
        guard let user = userData.first else {
            return NSLocalizedString("No data", comment: "")
        }
        
        let currentLanguage = settingsManager.currentLanguage.rawValue
        let sorted = user.progress
            .filter { $0.language == currentLanguage }
            .sorted { $0.id > $1.id }
        
        if let lastProgress = sorted.first,
           lastProgress.correctAnswer > 0,
           lastProgress.totalQuestion > 0 {
            let languageEnum = AppLanguage(rawValue: lastProgress.language) ?? .english
            return "\(languageEnum.localizedString): \(lastProgress.correctAnswer)/\(lastProgress.totalQuestion)"
        }
        return NSLocalizedString("No data", comment: "")
    }
    
    var allProgress: String {
        guard let user = userData.first else {
            return NSLocalizedString("No data", comment: "")
        }
        
        let currentLanguage = settingsManager.currentLanguage.rawValue
        let filteredProgress = user.progress
            .filter { $0.language == currentLanguage }
        
        if filteredProgress.isEmpty {
            return NSLocalizedString("No data", comment: "")
        }
        
        let totalCorrectAnswer = filteredProgress.reduce(0) { $0 + $1.correctAnswer }
        let totalQuestions = filteredProgress.reduce(0) { $0 + $1.totalQuestion }
        
        return NSLocalizedString("Correct answers:", comment: "") + " \(totalCorrectAnswer)/\(totalQuestions)"
    }
    
    func setShadow(colorScheme: ColorScheme) -> Color {
        switch settingsManager.currentTheme {
        case .light:
            return .gray.opacity(0.3)
        case .dark:
            return .black.opacity(0.3)
        case .system:
            return colorScheme == .light ? .gray.opacity(0.2) : .black.opacity(0.2)
        }
    }
    
    func updateLanguage() {
        if let user = userData.first {
            selectedLanguage = user.selectedLanguage
        }
    }
    
    func saveSelectedLanguage(_ language: String) {
        if let user = userData.first {
            user.selectedLanguage = language
            try? context.save()
            NotificationCenter.default.post(name: .progressDataDidChange, object: nil)
        }
    }
}
