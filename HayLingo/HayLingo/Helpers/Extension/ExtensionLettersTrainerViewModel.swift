//
//  ExtensionLettersTrainerViewModel.swift
//  HayLingo
//
//  Created by Karen Vardanian on 05.12.2024.
//

import Foundation

extension LettersTrainerViewModel {    
    static func preview(language: String = "Russian") -> LettersTrainerViewModel {
        
        let testUserData = [
            UserData(name: "Test User", selectedLanguage: language)
        ]
        return LettersTrainerViewModel(userData: testUserData)
    }
}
