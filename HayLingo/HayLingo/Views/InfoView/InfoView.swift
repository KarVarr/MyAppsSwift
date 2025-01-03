//
//  InfoView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 09.12.2024.
//

import SwiftUI
import SwiftData

struct InfoView: View {
    @Environment(\.modelContext) var context
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var settingsManager = BaseSettingsManager.shared
    @StateObject private var viewModel: InfoViewModel
    
    init(context: ModelContext? = nil) {
        let modelContext = context ?? ModelContext(try! ModelContainer(for: UserData.self))
        _viewModel = StateObject(wrappedValue: InfoViewModel(context: modelContext))
    }
    
    var body: some View {
        VStack {
            AppIconView()
            AppHeaderView()
            
            ActionsView(viewModel: viewModel)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            Text("© 2022 - 2024 Karen Vardanian")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(20)
        }
        .padding(.top, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .alert("Delete All Data", isPresented: $viewModel.isShowingDeleteAlert) {
            Button("Yes", role: .destructive) {
                viewModel.clearProgressData()
                viewModel.isShowingConfirmationAlert = true
            }
            Button("No", role: .cancel) {}
        } message: {
            Text("Are you sure you want to delete all your progress data? This action cannot be undone.")
        }
        .alert("Data Deleted", isPresented: $viewModel.isShowingConfirmationAlert) {
            Button("OK", role: .none) {}
        } message: {
            Text("Your progress data has been successfully deleted.")
        }
    }
    
    private var backgroundColor: Color {
        Helper.ThemeColorManager.setColorInDarkMode(
            light: Helper.ColorHex.backgroundLightGray,
            dark: Helper.ColorHex.backgroundDarkGray,
            themeManager: settingsManager,
            colorScheme: colorScheme
        )
    }
}


#Preview {
    InfoView()
        .environmentObject(ThemeManager())
}
