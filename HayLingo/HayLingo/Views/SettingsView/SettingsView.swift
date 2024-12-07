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
    let languages: [String] = ["Russian", "English"]
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
            // Основной экран
            Helper.ColorHex.backgroundGray.ignoresSafeArea() // Цвет фона главного экрана
            
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
                            showSettings = false // Закрытие при нажатии вне окна
                        }
                    
                    GeometryReader { geometry in
                        VStack(spacing: 16) {
                            Text("Настройки")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            // Настройки
                            let vStackWidth = geometry.size.width * 0.7
                            
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
                                    saveSelectedLanguage(newValue)
                                }
                                .pickerStyle(.segmented)
                                .frame(width: vStackWidth)
                            }
                            
                            
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
    
    private func saveSelectedLanguage(_ language: String) {
        if let user = userData.first {
            user.selectedLanguage = language
            try? context.save()
        }
    }
}

struct SettingOptionView: View {
    let title: String
    let options: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            
            HStack {
                ForEach(options, id: \.self) { option in
                    Button(option) {}
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
            }
        }
    }
}



#Preview {
    SettingsView()
}
