//
//  BaseSettingsManager.swift
//  HayLingo
//
//  Created by Karen Vardanian on 31.12.2024.
//

import Foundation
import SwiftUI

final class BaseSettingsManager: ObservableObject {
    static let shared = BaseSettingsManager()
    private init() {}
    
    @AppStorage("selectedTheme") private var storedTheme: String = AppTheme.system.rawValue
    @AppStorage("selectedLanguage") private var storedLanguage: String = AppLanguage.russian.rawValue
    @AppStorage("selectedSound") private var storedSound: String = AppSound.on.rawValue
    @AppStorage("selectedVibration") private var storedVibration: String = AppVibration.on.rawValue
    
    var currentTheme: AppTheme {
        AppTheme(rawValue: storedTheme) ?? .system
    }
    
    var currentLanguage: AppLanguage {
        AppLanguage(rawValue: storedLanguage) ?? .russian
    }
    
    var isSoundEnabled: Bool {
        storedSound == AppSound.on.rawValue
    }
    
    var isVibrationEnabled: Bool {
        storedVibration == AppVibration.on.rawValue
    }
    
    func updateTheme(_ theme: AppTheme) {
        storedTheme = theme.rawValue
        objectWillChange.send()
    }
    
    func updateLanguage(_ language: AppLanguage) {
        storedLanguage = language.rawValue
        objectWillChange.send()
        NotificationCenter.default.post(name: .languageDidChange, object: nil)
    }
    
    func updateSound(_ sound: AppSound) {
        storedSound = sound.rawValue
        objectWillChange.send()
        NotificationCenter.default.post(name: .soundSettingsDidChange, object: nil)
    }
    
    func updateVibration(_ vibration: AppVibration) {
        storedVibration = vibration.rawValue
        objectWillChange.send()
        NotificationCenter.default.post(name: .vibrationSettingsDidChange, object: nil)
    }
    
    func colorScheme() -> ColorScheme? {
        switch currentTheme {
        case .light: return .light
        case .dark: return .dark
        case .system: return nil
        }
    }
}
