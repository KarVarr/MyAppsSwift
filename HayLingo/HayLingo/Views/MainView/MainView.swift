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
    
    @State private var isInfoViewPresented = false
    @State private var showSettings = false
    @State private var selectedLanguage: String = "Russian"
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 20) {
                    Spacer()
                    Text("HayLingo")
                        .frame(height: geometry.size.height / 6)
                        .font(.system(size: 46, weight: .bold, design: .monospaced))
                        .foregroundStyle(Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.red, dark: Helper.ColorHex.orange, themeManager: themeManager, colorScheme: colorScheme))
                    
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
                        titleSize: 12,
                        width: vStackWidth,
                        backgroundColor: Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.white, dark: Helper.ColorHex.lightGray, themeManager: themeManager, colorScheme: colorScheme),
                        textColor: Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.darkBlue, dark: Helper.ColorHex.black, themeManager: themeManager, colorScheme: colorScheme),
                        spacing: 10,
                        alignment: .leading,
                        shadowColor: setShadow()
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
                        titleSize: 12,
                        width: vStackWidth,
                        backgroundColor: Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.white, dark: Helper.ColorHex.lightGray, themeManager: themeManager, colorScheme: colorScheme),
                        textColor: Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.darkBlue, dark: Helper.ColorHex.black, themeManager: themeManager, colorScheme: colorScheme),
                        spacing: 10,
                        alignment: .leading,
                        shadowColor: setShadow()
                    )
                    
                    Group {
                        //MARK: - History
                        NavigationLink(destination: TalesListView()) {
                            VStackContent(
                                title: "Rules of language",
                                subtitle: nil,
                                titleSize: 18,
                                width: vStackWidth,
                                backgroundColor: Helper.ColorHex.red,
                                textColor: Helper.ColorHex.white,
                                spacing: 1,
                                alignment: .center,
                                shadowColor: setShadow()
                            )
                        }
                        
                        //MARK: - Settings
                        Button {
                            showSettings = true
                        } label: {
                            VStackContent(
                                title: "Settings",
                                subtitle: nil,
                                titleSize: 18,
                                width: vStackWidth,
                                backgroundColor: Helper.ColorHex.blue,
                                textColor: Helper.ColorHex.white,
                                spacing: 1,
                                alignment: .center,
                                shadowColor: setShadow()
                            )
                        }
                        
                        
                        //MARK: - Play Game
                        NavigationLink(destination: LettersView()) {
                            VStackContent(
                                title: "Study",
                                subtitle: nil,
                                titleSize: 18,
                                width: vStackWidth,
                                backgroundColor: Helper.ColorHex.orange,
                                textColor: Helper.ColorHex.white,
                                spacing: 1,
                                alignment: .center,
                                shadowColor: setShadow()
                            )
                        }
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded(
                            {
                                Helper.SoundClick.triggerSound(userData: userData)
                                Helper.Haptic.triggerVibration(
                                    userData: userData,
                                    style: .light
                                )
                            }
                        )
                    )
                    
                    
                    Spacer()
                    
                    //MARK: - InfoView
                    Button {
                        Helper.SoundClick.triggerSound(userData: userData)
                        Helper.Haptic.triggerVibration(userData: userData, style: .light)
                        isInfoViewPresented = true
                    } label: {
                        Image(systemName: "info")
                        
                    }
                    .padding(.bottom, 20)
                    .sheet(isPresented: $isInfoViewPresented) {
                        InfoView()
                    }
                }
                .frame(maxWidth: .infinity, minHeight: geometry.size.height)
                
                .background(Helper.ThemeColorManager.setColorInDarkMode(light: Helper.ColorHex.backgroundLightGray, dark: Helper.ColorHex.backgroundDarkGray, themeManager: themeManager, colorScheme: colorScheme))
                .overlay(
                    ZStack {
                        if showSettings {
                            Color.black.opacity(0.4)
                                .ignoresSafeArea()
                                .onTapGesture {
                                    withAnimation {
                                        showSettings = false
                                    }
                                }
                            SettingsView(showSettings: $showSettings)
                                .frame(width: geometry.size.width)
                                .transition(
                                    .asymmetric(
                                        insertion: .move(edge: .bottom),
                                        removal: .move(edge: .top)
                                    ))                               .environment(\.modelContext, context)
                                .environmentObject(themeManager)
                        }
                    }
                )
                .animation(.easeInOut, value: showSettings)
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
    
    private func setShadow() -> Color {
        switch themeManager.currentTheme {
        case .light:
            return .gray.opacity(0.3)
        case .dark:
            return .black.opacity(0.3)
        case .system:
            return colorScheme == .light ? .gray.opacity(0.2) : .black.opacity(0.2)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ThemeManager())
}
