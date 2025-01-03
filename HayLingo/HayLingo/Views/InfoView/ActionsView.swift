//
//  ActionsView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct ActionsView: View {
    @ObservedObject var viewModel: InfoViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            InfoActionButton(
                icon: "arrow.up.right.square",
                title: NSLocalizedString("Show in AppStore", comment: "")
            ) {
                viewModel.openAppStore()
            }
            
            InfoActionButton(
                icon: "star",
                title: NSLocalizedString("Rate the app", comment: "")
            ) {
                viewModel.rateApp()
            }
            
            InfoActionButton(
                icon: "app.badge",
                title: NSLocalizedString("Our other apps", comment: "")
            ) {
                viewModel.openOtherApps()
            }
            
            Spacer()
            
            InfoActionButton(
                icon: "trash",
                title: NSLocalizedString("Delete all data", comment: ""),
                backgroundColor: .red.opacity(0.8)
            ) {
                viewModel.isShowingDeleteAlert = true
            }
        }
    }
}

