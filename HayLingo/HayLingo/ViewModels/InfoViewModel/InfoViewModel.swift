//
//  InfoViewModel.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI
import SwiftData

class InfoViewModel: ObservableObject {
    let context: ModelContext
    @Published var isShowingDeleteAlert = false
    @Published var isShowingConfirmationAlert = false
    @Query private var userData: [UserData]
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func openAppStore() {
        openURL("https://apps.apple.com/app/id\(Keys.appID)")
    }
    
    func rateApp() {
        openURL("https://apps.apple.com/app/id\(Keys.appID)?action=write-review")
    }
    
    func openOtherApps() {
        openURL("https://apps.apple.com/developer/id\(Keys.devID)")
    }
    
    func clearProgressData() {
        do {
            let descriptor = FetchDescriptor<UserData>()
            let users = try context.fetch(descriptor)
            
            for user in users {
                user.progress.removeAll()
            }
            try context.save()
            
            NotificationCenter.default.post(
                name: .progressDataDidChange,
                object: nil
            )
        } catch {
            print("Error clearing progress data: \(error)")
        }
    }
    
    private func openURL(_ urlString: String) {
        guard let url = URL(string: urlString),
              UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

