//
//  MainView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) var context
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var themeManager: ThemeManager
    
    @Query var userData: [UserData]
    
    @State private var showSettings = false
    @State private var selectedLanguage: String = "Russian"
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 20) {
                        Text("HayLingo")
                            .frame(height: geometry.size.height / 6)
                            .font(.system(size: 46, weight: .bold, design: .monospaced))
                            .foregroundStyle(determineTextColor())
                        
                        Text("Hello, \(userData.first?.name ?? "Guest")!")
                        
                        let vStackWidth = geometry.size.width * 0.7
                        
                        var latestProgress: String {
                            guard let user = userData.first else { return "No data" }
                            if let lastProgress = user.progress.last(where: { $0.language == selectedLanguage && $0.correctAnswer > 0 && $0.totalQuestion > 0 }) {
                                return "\(lastProgress.language): \(lastProgress.correctAnswer)/\(lastProgress.totalQuestion)"
                            }
                            return "No progress yet"
                        }
                        
                        
                        VStackContent(
                            title: "Previous lessons",
                            subtitle: latestProgress,
                            width: vStackWidth,
                            backgroundColor: Helper.ColorHex.white,
                            textColor: Helper.ColorHex.darkGray,
                            spacing: 10,
                            alignment: .leading
                        )
                        
                        
                        
                        var allProgress: String {
                            guard let user = userData.first else { return "No data" }
                            let filteredProgress = user.progress.filter { $0.language == selectedLanguage }
                            
                            if filteredProgress.isEmpty {
                                return "No data for \(selectedLanguage)"
                            }
                            
                            let totalCorrectAnswer = filteredProgress.reduce(0) { $0 + $1.correctAnswer }
                            let totalQuestions = filteredProgress.reduce(0) { $0 + $1.totalQuestion }
                            
                            return "Correct answers: \(totalCorrectAnswer)/\(totalQuestions)"
                        }
                        
                        var language: String {
                            if let user = userData.first, let lastProgress = user.progress.last {
                                return lastProgress.language
                            } else {
                                return "Unknown"
                            }
                        }
                        
                        
                        VStackContent(
                            title: "Your progress in \(selectedLanguage)",
                            subtitle: allProgress,
                            width: vStackWidth,
                            backgroundColor: Helper.ColorHex.white,
                            textColor: Helper.ColorHex.darkGray,
                            spacing: 10,
                            alignment: .leading
                        )
                        
                        //MARK: - History
                        NavigationLink(destination: HistoryOfArmenianLanguageView()) {
                            VStackContent(
                                title: "History of Armenian language",
                                subtitle: nil,
                                width: vStackWidth,
                                backgroundColor: Helper.ColorHex.red,
                                textColor: Helper.ColorHex.white,
                                spacing: 1,
                                alignment: .center
                            )
                        }
                        
                        //MARK: - Settings
                        Button {
                            showSettings = true
                        } label: {
                            VStackContent(
                                title: "Settings",
                                subtitle: nil,
                                width: vStackWidth,
                                backgroundColor: Helper.ColorHex.blue,
                                textColor: Helper.ColorHex.white,
                                spacing: 1,
                                alignment: .center
                            )
                        }
                        
                        
                        //MARK: - Play Game
                        NavigationLink(destination: LettersView()) {
                            VStackContent(
                                title: "Play game",
                                subtitle: nil,
                                width: vStackWidth,
                                backgroundColor: Helper.ColorHex.orange,
                                textColor: Helper.ColorHex.white,
                                spacing: 1, alignment: .center
                            )
                        }
                        
                    }
                    .frame(maxWidth: .infinity, minHeight: geometry.size.height)
                }
                .background(determineBackgroundColor())
                .overlay(
                    ZStack {
                        if showSettings {
                            Color.black.opacity(0.4)
                                .ignoresSafeArea()
                                .onTapGesture {
                                    showSettings = false
                                }
                            SettingsView(showSettings: $showSettings)
                                .frame(width: geometry.size.width)
                                .environment(\.modelContext, context)
                                .environmentObject(themeManager)
                        }
                    }
                )
            }
            .environmentObject(themeManager)
        }
        .onAppear {
            if userData.isEmpty {
                let newUser = UserData(
                    id: UUID(),
                    name: "Misha",
                    selectedLanguage: "Russian",
                    selectedTheme: "Light",
                    selectedSound: "On",
                    selectedVibration: "On",
                    progress: []
                )
                context.insert(newUser)
                try? context.save()
            }
            NotificationCenter.default.addObserver(forName: .languageDidChange, object: nil, queue: .main) { _ in
                updateLanguage()
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self, name: .languageDidChange, object: nil)
        }
    }
    
    private func updateLanguage() {
            if let user = userData.first {
                selectedLanguage = user.selectedLanguage ?? "Russian"
            }
        }
    
    private func saveSelectedLanguage(_ language: String) {
        if let user = userData.first {
            user.selectedLanguage = language
            try? context.save()
        }
    }
    
    private func determineTextColor() -> Color {
        switch themeManager.currentTheme {
        case .light:
            return Color.red
        case .dark:
            return Color.blue
        case .system:
            return colorScheme == .light ? .red : .blue
        }
    }
    
    private func determineBackgroundColor() -> Color {
        switch themeManager.currentTheme {
        case .light:
            return Helper.ColorHex.backgroundGray
        case .dark:
            return Helper.ColorHex.darkGray
        case .system:
            return colorScheme == .light ? Helper.ColorHex.backgroundGray : Helper.ColorHex.darkGray
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ThemeManager())
}
