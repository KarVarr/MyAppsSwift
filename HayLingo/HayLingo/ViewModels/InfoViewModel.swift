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
        for user in userData {
            for progress in user.progress {
                progress.correctAnswer = 0
                progress.totalQuestion = 0
            }
        }
        
        do {
            try context.save()
            print("All progress data has been reset.")
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
    
    private func openURL(_ urlString: String) {
        guard let url = URL(string: urlString),
              UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

