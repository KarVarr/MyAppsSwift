//
//  SettingsView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 26.11.2024.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @StateObject private var settingsManager = BaseSettingsManager.shared
    @Environment(\.modelContext) var context
    @Environment(\.colorScheme) var colorScheme
    @Query var userData: [UserData]
    
    @Binding var showSettings: Bool
    
    @State private var selectedLanguage = "Russian"
    @State private var selectedTheme = "Light"
    @State private var selectedSound = "On"
    @State private var selectedVibration = "On"
    
    // Используем локализованные строки из enum'ов
    let languages: [String] = AppLanguage.allCases.map { $0.localizedString }
    let themes: [String] = AppTheme.allCases.map { $0.localizedString }
    let sounds: [String] = AppSound.allCases.map { $0.localizedString }
    let vibration: [String] = AppVibration.allCases.map { $0.localizedString }
    
    init(showSettings: Binding<Bool>) {
        self._showSettings = showSettings
        
        self._selectedLanguage = State(initialValue: AppLanguage.russian.localizedString)
        self._selectedTheme = State(initialValue: AppTheme.system.localizedString)
        self._selectedSound = State(initialValue: AppSound.on.localizedString)
        self._selectedVibration = State(initialValue: AppVibration.on.localizedString)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                Text("Settings")
                    .font(.system(size: 18))
                    .foregroundStyle(Helper.ColorHex.darkBlue)
                
                //MARK: - Settings
                let vStackWidth = geometry.size.width * 0.85
                
                //MARK: - Language
                VStack(alignment: .leading) {
                    Text("Select a language")
                        .font(.system(size: 12))
                        .foregroundStyle(Helper.ColorHex.lightBlack)
                    
                    Picker("Language", selection: $selectedLanguage) {
                        ForEach(languages, id: \.self) {
                            Text($0)
                                .font(.largeTitle)
                                .foregroundStyle(Helper.ColorHex.darkBlue)
                        }
                    }
                    .onChange(of: selectedLanguage) {_, newValue in
                        let language = AppLanguage.fromLocalizedString(newValue)
                        settingsManager.updateLanguage(language)
                        saveOption { user in
                            user.selectedLanguage = language.rawValue
                        }
                        NotificationCenter.default.post(name: .languageDidChange, object: nil)
                    }
                    .pickerStyle(.segmented)
                    
                    .frame(width: vStackWidth)
                }
                
                //MARK: - Theme
                VStack(alignment: .leading) {
                    Text("Select a theme")
                        .font(.system(size: 12))
                        .foregroundStyle(Helper.ColorHex.lightBlack)
                    
                    Picker("Theme", selection: $selectedTheme) {
                        ForEach(themes, id: \.self) {
                            Text($0)
                                .foregroundStyle(Helper.ColorHex.darkBlue)
                        }
                    }
                    .onChange(of: selectedTheme) {_, newValue in
                        let theme = AppTheme.fromLocalizedString(newValue)
                        settingsManager.updateTheme(theme)
                        saveOption { user in
                            user.selectedTheme = theme.rawValue
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(width: vStackWidth)
                }
                
                //MARK: - Sound
                VStack(alignment: .leading) {
                    Text("Sounds in app")
                        .font(.system(size: 12))
                        .foregroundStyle(Helper.ColorHex.lightBlack)
                    
                    Picker("Sound", selection: $selectedSound) {
                        ForEach(sounds, id: \.self) {
                            Text($0)
                                .foregroundStyle(Helper.ColorHex.darkBlue)
                            
                        }
                    }
                    .onChange(of: selectedSound) {_, newValue in
                        let sound = AppSound.fromLocalizedString(newValue)
                        settingsManager.updateSound(sound)
                        saveOption { user in
                            user.selectedSound = sound.rawValue
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(width: vStackWidth)
                }
                
                //MARK: - Vibration
                VStack(alignment: .leading) {
                    Text("Vibration in app")
                        .foregroundStyle(Helper.ColorHex.lightBlack)
                    
                        .font(.system(size: 12))
                    
                    Picker("Vibration", selection: $selectedVibration) {
                        ForEach(vibration, id: \.self) {
                            Text($0)
                                .foregroundStyle(Helper.ColorHex.darkBlue)
                            
                        }
                    }
                    .onChange(of: selectedVibration) {_, newValue in
                        let vibration = AppVibration.fromLocalizedString(newValue)
                        settingsManager.updateVibration(vibration)
                        saveOption { user in
                            user.selectedVibration = vibration.rawValue
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(width: vStackWidth)
                }
                
                Divider()
                
                //MARK: - Close Button
                Button("Close") {
                    showSettings = false
                    print("press button")
                }
                .padding(7)
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .background(setColorInDarkMode(light: Helper.ColorHex.grey.opacity(0.15), dark: Helper.ColorHex.blue.opacity(0.2)))
                .foregroundStyle(setColorInDarkMode(light: Helper.ColorHex.darkBlue, dark: Helper.ColorHex.black))
                .cornerRadius(10)
                .contentShape(Rectangle())
                .simultaneousGesture(
                    TapGesture().onEnded {
                        showSettings = false
                        print("on end press button")
                    }
                )
            }
            .padding()
            .frame(width: geometry.size.width * 0.9)
            .background(setColorInDarkMode(light: Helper.ColorHex.white, dark: Color.blue))
            .cornerRadius(20)
            .shadow(color: setColorInDarkMode(light: Helper.ColorHex.grey.opacity(0.3), dark: Helper.ColorHex.blue.opacity(0.3)),radius:20,x:0,y:0)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            print("userdata: \(userData)")
            loadInitialSettings()
        }
    }
    
    
    private func loadInitialSettings() {
        guard userData.first != nil else {
            createDefaultUser()
            return
        }
        
        selectedLanguage = AppLanguage(rawValue: settingsManager.currentLanguage.rawValue)?.localizedString ?? AppLanguage.russian.localizedString
        selectedTheme = AppTheme(rawValue: settingsManager.currentTheme.rawValue)?.localizedString ?? AppTheme.system.localizedString
        selectedSound = AppSound(rawValue: settingsManager.isSoundEnabled ? "sound_on" : "sound_off")?.localizedString ?? AppSound.on.localizedString
        selectedVibration = AppVibration(rawValue: settingsManager.isVibrationEnabled ? "vibration_on" : "vibration_off")?.localizedString ?? AppVibration.on.localizedString
    }
    
    private func createDefaultUser() {
        let newUser = UserData(id: UUID())
        context.insert(newUser)
        do {
            try context.save()
            print("Default user created")
        } catch {
            print("Failed to create default user: \(error)")
        }
    }
    
    private func saveOption(_ update: (UserData) -> Void) {
        guard let user = userData.first else { return }
        update(user)
        
        do {
            try context.save()
            
            user.selectedLanguage = settingsManager.currentLanguage.rawValue
            user.selectedSound = settingsManager.isSoundEnabled ? AppSound.on.rawValue : AppSound.off.rawValue
            user.selectedVibration = settingsManager.isVibrationEnabled ? AppVibration.on.rawValue : AppVibration.off.rawValue
            
            print("Settings saved: \(user)")
        } catch {
            print("Save error: \(error)")
        }
    }
    
    
    private func setColorInDarkMode(light lightColor: Color, dark darkColor: Color) -> Color {
        switch settingsManager.currentTheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        case .system:
            return colorScheme == .light ? lightColor
            : darkColor
        }
    }
}

#Preview {
    SettingsView(showSettings: .constant(false))
        .environmentObject(BaseSettingsManager.shared)
}



