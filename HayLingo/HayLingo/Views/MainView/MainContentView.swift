//
//  MainContentView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

// MainView/MainContentView.swift
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
            headerSection
            progressSection
            navigationButtons
            infoButton
        }
        .frame(maxWidth: .infinity, minHeight: geometry.size.height)
        .background(backgroundStyle)
        .overlay(settingsOverlay)
        .animation(.easeInOut, value: viewModel.showSettings)
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack {
            Spacer()
            Text("HayLingo")
                .frame(height: geometry.size.height / 6)
                .font(.system(size: 46, weight: .bold, design: .monospaced))
                .foregroundStyle(headerColor)
        }
    }
    
    private var headerColor: Color {
        Helper.ThemeColorManager.setColorInDarkMode(
            light: Helper.ColorHex.red,
            dark: Helper.ColorHex.orange,
            themeManager: settingsManager,
            colorScheme: colorScheme
        )
    }
    
    // MARK: - Progress Section
    private var progressSection: some View {
        VStack(spacing: 20) {
            previousLessonsCard
            totalProgressCard
        }
    }
    
    private var previousLessonsCard: some View {
        VStackContent(
            title: NSLocalizedString("Previous lessons", comment: ""),
            subtitle: viewModel.latestProgress,
            titleSize: 12,
            width: vStackWidth,
            backgroundColor: cardBackgroundColor,
            textColor: cardTextColor,
            spacing: 10,
            alignment: .leading,
            shadowColor: viewModel.setShadow(colorScheme: colorScheme)
        )
    }
    
    private var totalProgressCard: some View {
        VStackContent(
            title: NSLocalizedString("Your progress", comment: "") +
                  " (\(settingsManager.currentLanguage.localizedString))",
            subtitle: viewModel.allProgress,
            titleSize: 12,
            width: vStackWidth,
            backgroundColor: cardBackgroundColor,
            textColor: cardTextColor,
            spacing: 10,
            alignment: .leading,
            shadowColor: viewModel.setShadow(colorScheme: colorScheme)
        )
    }
    
    // MARK: - Navigation Buttons
    private var navigationButtons: some View {
        VStack(spacing: 20) {
            fairyTalesButton
            settingsButton
            studyButton
        }
    }
    
    private var fairyTalesButton: some View {
        NavigationLink(destination: TalesListView()) {
            VStackContent(
                title: NSLocalizedString("Armenian Fairy Tales", comment: ""),
                subtitle: nil,
                titleSize: 18,
                width: vStackWidth,
                backgroundColor: Helper.ColorHex.red,
                textColor: Helper.ColorHex.white,
                spacing: 1,
                alignment: .center,
                shadowColor: viewModel.setShadow(colorScheme: colorScheme)
            )
        }
        .simultaneousGesture(
            TapGesture().onEnded({
                Helper.SoundClick.triggerSound(userData: viewModel.userData)
                Helper.Haptic.triggerVibration(userData: viewModel.userData, style: .light)
            })
        )
    }
    
    private var settingsButton: some View {
        Button {
            viewModel.count += 1
            print("Settings button tapped \(viewModel.count)")
            viewModel.showSettings = true
        } label: {
            VStackContent(
                title: NSLocalizedString("Settings", comment: ""),
                subtitle: nil,
                titleSize: 18,
                width: vStackWidth,
                backgroundColor: Helper.ColorHex.blue,
                textColor: Helper.ColorHex.white,
                spacing: 1,
                alignment: .center,
                shadowColor: viewModel.setShadow(colorScheme: colorScheme)
            )
        }
    }
    
    private var studyButton: some View {
        NavigationLink(destination: LettersView()) {
            VStackContent(
                title: NSLocalizedString("Study", comment: ""),
                subtitle: nil,
                titleSize: 18,
                width: vStackWidth,
                backgroundColor: Helper.ColorHex.orange,
                textColor: Helper.ColorHex.white,
                spacing: 1,
                alignment: .center,
                shadowColor: viewModel.setShadow(colorScheme: colorScheme)
            )
        }
        .simultaneousGesture(
            TapGesture().onEnded({
                Helper.SoundClick.triggerSound(userData: viewModel.userData)
                Helper.Haptic.triggerVibration(userData: viewModel.userData, style: .light)
            })
        )
    }
    
    // MARK: - Info Button
    private var infoButton: some View {
        VStack {
            Spacer()
            Button {
                Helper.SoundClick.triggerSound(userData: viewModel.userData)
                Helper.Haptic.triggerVibration(userData: viewModel.userData, style: .light)
                viewModel.isInfoViewPresented = true
            } label: {
                Image(systemName: "info.circle")
            }
            .padding(.bottom, 20)
            .sheet(isPresented: $viewModel.isInfoViewPresented) {
                InfoView()
            }
        }
    }
    
    // MARK: - Background & Overlay
    private var backgroundStyle: Color {
        Helper.ThemeColorManager.setColorInDarkMode(
            light: Helper.ColorHex.backgroundLightGray,
            dark: Helper.ColorHex.backgroundDarkGray,
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
    
    // MARK: - Helper Properties
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
