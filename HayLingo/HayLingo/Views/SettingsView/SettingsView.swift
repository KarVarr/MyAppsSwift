//
//  SettingsView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 26.11.2024.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    
    @Binding var showSettings: Bool
    
    @State private var selectedLanguage = "Russian"
    @State private var selectedTheme = "Light"
    @State private var selectedSound = "On"
    @State private var selectedVibration = "On"
    
    let languages: [String] = ["Russian", "English"]
    let themes: [String] = ["Light", "Dark", "System"]
    let sounds: [String] = ["On", "Off"]
    let vibration: [String] = ["On", "Off"]
    
    
    //    var body: some View {
    //        VStack {
    //            Text("Settings")
    //            Text("Select your language")
    //
    //            Text("Select theme color")
    //
    //            Text("Delete all progress")
    //
    //            Text("Sound effects")
    //
    //            Text("Vibration")
    //
    //            Text("Rate us")
    //            Text("Close button")
    //            Text("Privacy policy")
    //        }
    
    //    }
    
   
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16) {
                Text("Настройки")
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
                                .foregroundStyle(Helper.ColorHex.darkBlue)
                                .tag($0) // ???
                        }
                    }
                    .onChange(of: selectedLanguage) {_, newValue in
                        saveOption { user in
                            user.selectedLanguage = newValue
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
                        saveOption { user in
                            user.selectedTheme = newValue
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
                        saveOption { user in
                            user.selectedSound = newValue
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(width: vStackWidth)
                }
                
                //MARK: - Vibration
                VStack(alignment: .leading) {
                    Text("Vibration in app")
                        .font(.system(size: 12))
                        .foregroundStyle(Helper.ColorHex.lightBlack)
                    
                    Picker("Vibration", selection: $selectedVibration) {
                        ForEach(vibration, id: \.self) {
                            Text($0)
                                .foregroundStyle(Helper.ColorHex.darkBlue)
                        }
                    }
                    .onChange(of: selectedVibration) {_, newValue in
                        saveOption { user in
                            user.selectedVibration = newValue
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
                .background(Color.gray.opacity(0.2))
                .foregroundStyle(Helper.ColorHex.darkBlue)
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
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.3),radius:20,x:0,y:0)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            loadInitialSettings()
        }
    }
    
    private func loadInitialSettings() {
        guard let user = userData.first else {
            createDefaultUser()
            return
        }
        
        selectedLanguage = user.selectedLanguage ?? "Russian"
        selectedTheme = user.selectedTheme ?? "Light"
        selectedSound = user.selectedSound ?? "On"
        selectedVibration = user.selectedVibration ?? "On"
    }
    
    private func createDefaultUser() {
        let newUser = UserData(id: UUID())
        context.insert(newUser)
        try? context.save()
    }
    
    private func saveOption(_ update: (UserData) -> Void) {
        guard let user = userData.first else { return }
        update(user)
        try? context.save()
    }
}

#Preview {
    SettingsView(showSettings: .constant(false))
}



