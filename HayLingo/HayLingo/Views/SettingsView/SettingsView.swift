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
    
    @State private var showSettings = false
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
        ZStack {
            Helper.ColorHex.backgroundGray.ignoresSafeArea()
            Button("Открыть настройки") {
                showSettings = true
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
        }
        .overlay(
            Group {
                if showSettings {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showSettings = false
                        }
                    
                    GeometryReader { geometry in
                        VStack(spacing: 16) {
                            Text("Настройки")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            //MARK: - Settings
                            let vStackWidth = geometry.size.width * 0.7
                            
                            //MARK: - Language
                            VStack(alignment: .leading) {
                                Text("Select a language")
                                    .font(.system(size: 12))
                                    .foregroundStyle(Helper.ColorHex.lightBlack)
                                
                                Picker("Language", selection: $selectedLanguage) {
                                    ForEach(languages, id: \.self) {
                                        Text($0)
                                            .foregroundStyle(Helper.ColorHex.darkBlue)
                                    }
                                }
                                .onChange(of: selectedLanguage) {_, newValue in
                                    saveOption { user in
                                        user.selectedLanguage = newValue
                                    }
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
                            
                            
                            
                            //MARK: - Close Button
                            Button("Закрыть") {
                                showSettings = false
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(.horizontal, 10)
                    }
                }
            }
        )
    }
    
    private func saveOption(_ update: (inout UserData) -> Void) {
        if var user = userData.first {
            update(&user)
            try? context.save()
        }
    }
}


#Preview {
    SettingsView()
}
