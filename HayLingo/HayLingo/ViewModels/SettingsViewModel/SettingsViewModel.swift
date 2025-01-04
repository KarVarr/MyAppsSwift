//
//  SettingsViewModel.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI
import SwiftData

class SettingsViewModel: ObservableObject {
    let context: ModelContext
    private let settingsManager: BaseSettingsManager
    
    @Query private var userDataQuery: [UserData]
    
    var userData: [UserData] {
        userDataQuery
    }
    
    @Published var selectedLanguage: String {
        didSet {
            if oldValue != selectedLanguage {
                updateLanguage(selectedLanguage)
            }
        }
    }
    @Published var selectedTheme: String {
        didSet {
            if oldValue != selectedTheme {
                updateTheme(selectedTheme)
            }
        }
    }
    @Published var selectedSound: String {
        didSet {
            if oldValue != selectedSound {
                updateSound(selectedSound)
            }
        }
    }
    @Published var selectedVibration: String {
        didSet {
            if oldValue != selectedVibration {
                updateVibration(selectedVibration)
            }
        }
    }
    
    let languages = AppLanguage.allCases.map { $0.localizedString }
    let themes = AppTheme.allCases.map { $0.localizedString }
    let sounds = AppSound.allCases.map { $0.localizedString }
    let vibration = AppVibration.allCases.map { $0.localizedString }
    
    init(context: ModelContext, settingsManager: BaseSettingsManager = .shared) {
        self.context = context
        self.settingsManager = settingsManager
        
        self.selectedLanguage = AppLanguage(rawValue: settingsManager.currentLanguage.rawValue)?.localizedString ?? AppLanguage.russian.localizedString
        self.selectedTheme = AppTheme(rawValue: settingsManager.currentTheme.rawValue)?.localizedString ?? AppTheme.system.localizedString
        self.selectedSound = AppSound(rawValue: settingsManager.isSoundEnabled ? "sound_on" : "sound_off")?.localizedString ?? AppSound.on.localizedString
        self.selectedVibration = AppVibration(rawValue: settingsManager.isVibrationEnabled ? "vibration_on" : "vibration_off")?.localizedString ?? AppVibration.on.localizedString
    }
    
    private func updateLanguage(_ newValue: String) {
        let language = AppLanguage.fromLocalizedString(newValue)
        settingsManager.updateLanguage(language)
        saveOption { user in
            user.selectedLanguage = language.rawValue
        }
    }
    
    private func updateTheme(_ newValue: String) {
        let theme = AppTheme.fromLocalizedString(newValue)
        settingsManager.updateTheme(theme)
        saveOption { user in
            user.selectedTheme = theme.rawValue
        }
        triggerFeedback()
    }
    
    private func updateSound(_ newValue: String) {
        let sound = AppSound.fromLocalizedString(newValue)
        settingsManager.updateSound(sound)
        saveOption { user in
            user.selectedSound = sound.rawValue
        }
        triggerFeedback()
    }
    
    private func updateVibration(_ newValue: String) {
        let vibration = AppVibration.fromLocalizedString(newValue)
        settingsManager.updateVibration(vibration)
        saveOption { user in
            user.selectedVibration = vibration.rawValue
        }
        triggerFeedback()
    }
    
    private func triggerFeedback() {
        do {
            let descriptor = FetchDescriptor<UserData>()
            let userData = try context.fetch(descriptor)
            Helper.SoundClick.triggerSound(userData: userData)
            Helper.Haptic.triggerVibration(userData: userData, style: .light)
        } catch {
            print("Error triggering feedback: \(error)")
        }
    }

    private func saveOption(_ update: (UserData) -> Void) {
        do {
            let descriptor = FetchDescriptor<UserData>()
            let userData = try context.fetch(descriptor)
            if let user = userData.first {
                update(user)
                
                user.selectedLanguage = settingsManager.currentLanguage.rawValue
                user.selectedSound = settingsManager.isSoundEnabled ? AppSound.on.rawValue : AppSound.off.rawValue
                user.selectedVibration = settingsManager.isVibrationEnabled ? AppVibration.on.rawValue : AppVibration.off.rawValue
                
                try context.save()
            }
        } catch {
            print("Error saving option: \(error)")
        }
    }
}

