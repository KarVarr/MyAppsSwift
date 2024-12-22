//
//   UserData.swift
//  HayLingo
//
//  Created by Karen Vardanian on 12.11.2024.
//

import Foundation
import SwiftData

@Model
class UserData {
    @Attribute(.unique) var id: UUID
    var name: String?
    var selectedLanguage: String
    var selectedTheme: String
    var selectedSound: String
    var selectedVibration: String
    var progress: [ProgressData]
    
    init(id: UUID,
         name: String? = nil,
         selectedLanguage: String = AppLanguage.russian.rawValue,
         selectedTheme: String = AppTheme.system.rawValue,
         selectedSound: String = AppSound.on.rawValue,
         selectedVibration: String = AppVibration.on.rawValue,
         progress: [ProgressData] = []) {
        self.id = id
        self.name = name
        self.selectedLanguage = selectedLanguage
        self.selectedTheme = selectedTheme
        self.selectedSound = selectedSound
        self.selectedVibration = selectedVibration
        self.progress = progress
    }
}
