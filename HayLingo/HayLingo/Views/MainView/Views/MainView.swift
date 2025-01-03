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
    @StateObject private var settingsManager = BaseSettingsManager.shared
    @StateObject private var viewModel: MainViewModel
    
    init(context: ModelContext? = nil) {
        let modelContext = context ?? ModelContext(try! ModelContainer(for: UserData.self))
        _viewModel = StateObject(wrappedValue: MainViewModel(context: modelContext))
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                MainContentView(geometry: geometry, viewModel: viewModel)
            }
            .environmentObject(settingsManager)
        }
        .onAppear {
            setupNotifications()
        }
        .onDisappear {
            removeNotifications()
        }
    }
    
    private func setupNotifications() {
        NotificationCenter.default.addObserver(
            forName: .languageDidChange,
            object: nil,
            queue: .main
        ) { _ in
            viewModel.updateLanguage()
        }
    }
    
    private func removeNotifications() {
        NotificationCenter.default.removeObserver(
            self,
            name: .languageDidChange,
            object: nil
        )
    }
}

#Preview {
    MainView()
}
