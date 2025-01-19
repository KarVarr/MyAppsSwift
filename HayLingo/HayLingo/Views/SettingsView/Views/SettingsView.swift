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
    @StateObject private var viewModel: SettingsViewModel
    @Query private var userData: [UserData]
    @Binding var showSettings: Bool
    
    private let deviceType = DeviceType.current
    
    init(showSettings: Binding<Bool>) {
        self._showSettings = showSettings
        let context = ModelContext(try! ModelContainer(for: UserData.self))
        _viewModel = StateObject(wrappedValue: SettingsViewModel(context: context))
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                Text("Settings")
                    .font(.system(size: 18))
                    .foregroundStyle(Helper.ColorHex.darkBlue)
                
                let vStackWidth = geometry.size.width * 0.85
                
                SettingsPickerView(
                    title: NSLocalizedString("Select a language", comment: ""),
                    options: viewModel.languages,
                    selection: $viewModel.selectedLanguage,
                    width: vStackWidth
                )
                
                SettingsPickerView(
                    title: NSLocalizedString("Select a theme", comment: ""),
                    options: viewModel.themes,
                    selection: $viewModel.selectedTheme,
                    width: vStackWidth
                )
                
                SettingsPickerView(
                    title: NSLocalizedString("Sounds in app", comment: ""),
                    options: viewModel.sounds,
                    selection: $viewModel.selectedSound,
                    width: vStackWidth
                )
                
                if deviceType == .phone {
                    SettingsPickerView(
                        title: NSLocalizedString("Vibration in app", comment: ""),
                        options: viewModel.vibration,
                        selection: $viewModel.selectedVibration,
                        width: vStackWidth
                    )
                }
                
                Divider()
                
                CloseButton(
                    showSettings: $showSettings,
                    userData: userData,
                    settingsManager: settingsManager
                )
            }
            .padding()
            .frame(width: geometry.size.width * 0.9)
            .background(backgroundColor)
            .cornerRadius(20)
            .shadow(color: shadowColor, radius: 20, x: 0, y: 0)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .environment(\.modelContext, viewModel.context)
    }
    
    private var backgroundColor: Color {
        Helper.ThemeColorManager.setColorInDarkMode(
            light: Helper.ColorHex.white,
            dark: Color.blue,
            themeManager: settingsManager,
            colorScheme: colorScheme
        )
    }
    
    private var shadowColor: Color {
        Helper.ThemeColorManager.setColorInDarkMode(
            light: Helper.ColorHex.grey.opacity(0.3),
            dark: Helper.ColorHex.blue.opacity(0.3),
            themeManager: settingsManager,
            colorScheme: colorScheme
        )
    }
}

#Preview {
    SettingsView(showSettings: .constant(false))
        .environmentObject(BaseSettingsManager.shared)
}
