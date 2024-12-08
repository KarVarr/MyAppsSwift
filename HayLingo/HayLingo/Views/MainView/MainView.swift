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
                            .foregroundStyle(determineTitleTextColor())
                        
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
                            backgroundColor: determineResultsRectangleBackgroundColor(),
                            textColor: determineTextOfResultsRectangle(),
                            spacing: 10,
                            alignment: .leading,
                            shadowColor: determineShadow()
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
                            backgroundColor: determineResultsRectangleBackgroundColor(),
                            textColor: determineTextOfResultsRectangle(),
                            spacing: 10,
                            alignment: .leading,
                            shadowColor: determineShadow()
                        )
                        
                        //MARK: - History
                        NavigationLink(destination: HistoryOfArmenianLanguageView()) {
                            VStackContent(
                                title: "History of Armenian language",
                                subtitle: nil,
                                width: vStackWidth,
                                backgroundColor: Helper.ColorHex.red,
                                textColor: determineTextOfFlagRectangle(),
                                spacing: 1,
                                alignment: .center,
                                shadowColor: determineShadow()
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
                                textColor: determineTextOfFlagRectangle(),
                                spacing: 1,
                                alignment: .center,
                                shadowColor: determineShadow()
                            )
                        }
                        
                        
                        //MARK: - Play Game
                        NavigationLink(destination: LettersView()) {
                            VStackContent(
                                title: "Play game",
                                subtitle: nil,
                                width: vStackWidth,
                                backgroundColor: Helper.ColorHex.orange,
                                textColor: determineTextOfFlagRectangle(),
                                spacing: 1,
                                alignment: .center,
                                shadowColor: determineShadow()
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
    
    private func determineTitleTextColor() -> Color {
        switch themeManager.currentTheme {
        case .light:
            return Helper.ColorHex.red
        case .dark:
            return Helper.ColorHex.orange
        case .system:
            return colorScheme == .light ? Helper.ColorHex.red : Helper.ColorHex.yellow
        }
    }
    
    private func determineBackgroundColor() -> Color {
        switch themeManager.currentTheme {
        case .light:
            return Helper.ColorHex.backgroundLightGray
        case .dark:
            return Helper.ColorHex.backgroundDarkGray
        case .system:
            return colorScheme == .light ? Helper.ColorHex.backgroundLightGray : Helper.ColorHex.backgroundDarkGray
        }
    }
    
    private func determineResultsRectangleBackgroundColor() -> Color {
        switch themeManager.currentTheme {
        case .light:
            return Helper.ColorHex.white
        case .dark:
            return Helper.ColorHex.lightGray
        case .system:
            return colorScheme == .light ? Helper.ColorHex.white : Helper.ColorHex.lightGray
        }
    }
    
    private func determineShadow() -> Color {
        switch themeManager.currentTheme {
        case .light:
            return .gray.opacity(0.3)
        case .dark:
            return .black.opacity(0.3)
        case .system:
            return colorScheme == .light ? .gray.opacity(0.2) : .black.opacity(0.2)
        }
    }
    
    private func determineTextOfFlagRectangle() -> Color {
        switch themeManager.currentTheme {
        case .light:
            return Helper.ColorHex.white
        case .dark:
            return Helper.ColorHex.backgroundDarkGray
        case .system:
            return colorScheme == .light ? Helper.ColorHex.white
            : Helper.ColorHex.backgroundDarkGray
        }
    }
    
    private func determineTextOfResultsRectangle() -> Color {
        switch themeManager.currentTheme {
        case .light:
            return Helper.ColorHex.darkBlue
        case .dark:
            return Helper.ColorHex.black
        case .system:
            return colorScheme == .light ? Helper.ColorHex.white
            : Helper.ColorHex.backgroundDarkGray
        }
    }
    
}

#Preview {
    MainView()
        .environmentObject(ThemeManager())
}
