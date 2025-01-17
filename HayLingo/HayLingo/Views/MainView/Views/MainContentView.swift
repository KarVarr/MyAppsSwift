//
//  MainContentView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI
import SwiftData

struct MainContentView: View {
    let geometry: GeometryProxy
    @ObservedObject var viewModel: MainViewModel
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var settingsManager: BaseSettingsManager
    
    private var vStackWidth: CGFloat {
        geometry.size.width * 0.7
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer() 
            AppHeader(
                height: geometry.size.height / 6,
                textColor: headerColor
            )
            
            ProgressSection(
                width: vStackWidth,
                latestProgress: viewModel.latestProgress,
                allProgress: viewModel.allProgress,
                currentLanguage: settingsManager.currentLanguage.localizedString,
                backgroundColor: cardBackgroundColor,
                textColor: cardTextColor,
                shadowColor: viewModel.setShadow(colorScheme: colorScheme)
            )
            
            NavigationButtonsSection(
                width: vStackWidth,
                shadowColor: viewModel.setShadow(colorScheme: colorScheme),
                userData: viewModel.userData,
                showSettings: $viewModel.showSettings
            )
            
            Spacer()
            
            InfoButtonView(
                userData: viewModel.userData,
                isPresented: $viewModel.isInfoViewPresented
            )
        }
        .frame(maxWidth: .infinity, minHeight: geometry.size.height)
        .background(backgroundStyle)
        .overlay(settingsOverlay)
        .animation(.easeInOut, value: viewModel.showSettings)
    }
    
    // MARK: - Helper Properties
    private var headerColor: Color {
        Helper.ThemeColorManager.setColorInDarkMode(
            light: Helper.ColorHex.red,
            dark: Helper.ColorHex.orange,
            themeManager: settingsManager,
            colorScheme: colorScheme
        )
    }
    
    private var backgroundStyle: Color {
        Helper.ThemeColorManager.setColorInDarkMode(
            light: Helper.ColorHex.backgroundLightGray,
            dark: Helper.ColorHex.backgroundDarkGray,
            themeManager: settingsManager,
            colorScheme: colorScheme
        )
    }
    
    private var cardBackgroundColor: Color {
        Helper.ThemeColorManager.setColorInDarkMode(
            light: Helper.ColorHex.white,
            dark: Helper.ColorHex.lightGray,
            themeManager: settingsManager,
            colorScheme: colorScheme
        )
    }
    
    private var cardTextColor: Color {
        Helper.ThemeColorManager.setColorInDarkMode(
            light: Helper.ColorHex.darkBlue,
            dark: Helper.ColorHex.black,
            themeManager: settingsManager,
            colorScheme: colorScheme
        )
    }
    
    private var settingsOverlay: some View {
        ZStack {
            if viewModel.showSettings {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            viewModel.showSettings = false
                        }
                    }
                SettingsView(showSettings: $viewModel.showSettings)
                    .frame(width: geometry.size.width)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .bottom),
                            removal: .move(edge: .top)
                        ))
                    .environment(\.modelContext, viewModel.context)
                    .environmentObject(settingsManager)
            }
        }
    }
}


#Preview {
    GeometryReader { geometry in
        MainContentView(
            geometry: geometry,
            viewModel: MainViewModel(
                context: ModelContext(try! ModelContainer(for: UserData.self))
            )
        )
        .environmentObject(BaseSettingsManager.shared)
    }
}
