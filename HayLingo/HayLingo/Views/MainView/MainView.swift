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
    @Query var userData: [UserData]
    
    @State private var showSettings = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 20) {
                        Text("HayLingo")
                            .frame(height: geometry.size.height / 6)
                            .font(.system(size: 46, weight: .bold, design: .monospaced))
                        
                        Text("Hello Vania!")
                        
                        let vStackWidth = geometry.size.width * 0.7
                        
                        var latestProgress: String {
                            if let user = userData.first {
                                if let lastProgress = user.progress.last(where: { $0.correctAnswer > 0 && $0.totalQuestion > 0 }) {
                                    return "\(lastProgress.language):  \(lastProgress.correctAnswer)/\(lastProgress.totalQuestion)"
                                }
                                return "No progress yet"
                            }
                            return "No data"
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
                            if let user = userData.first {
                                let filteredProgress = user.progress.filter { $0.language == language }
                                
                                if filteredProgress.isEmpty {
                                    return "No data for \(language)"
                                }
                                
                                let totalCorrectAnswer = filteredProgress.reduce(0) { $0 + $1.correctAnswer }
                                let totalQuestions = filteredProgress.reduce(0) { $0 + $1.totalQuestion }
                                
                                return "Correct answers: \(totalCorrectAnswer)/\(totalQuestions)"
                            } else {
                                return "No data"
                            }
                        }
                        
                        var language: String {
                            if let user = userData.first, let lastProgress = user.progress.last {
                                return lastProgress.language
                            } else {
                                return "Unknown"
                            }
                        }
                        
                        
                        VStackContent(
                            title: "Your progress in \(language == "Russian" ? "Russian" : "English")",
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
                .background(Helper.ColorHex.backgroundGray)
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
                        }
                    }
                )
            }
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
        }
    }
    
    private func saveSelectedLanguage(_ language: String) {
        if let user = userData.first {
            user.selectedLanguage = language
            try? context.save()
        }
    }
}

#Preview {
    MainView()
}
