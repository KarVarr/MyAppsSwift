//
//  ExtensionLettersTrainerViewModel.swift
//  HayLingo
//
//  Created by Karen Vardanian on 05.12.2024.
//

import Foundation

extension LettersTrainerViewModel {    
    static func preview(language: String = "Russian", theme: String = "Light", sound: String = "Off", vibration: String = "Off") -> LettersTrainerViewModel {
        
        let testUserData = [
            UserData(id: UUID(), name: "Test name", selectedLanguage: language, selectedTheme: theme, selectedSound: sound, selectedVibration: vibration, progress: [])
        ]
        return LettersTrainerViewModel(userData: testUserData)
    }
}
