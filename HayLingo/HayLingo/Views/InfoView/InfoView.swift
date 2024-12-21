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
    @EnvironmentObject var themeManager: ThemeManager
    @Query var userData: [UserData]
    
    private let appID: Int = 1
    
    var body: some View {
        VStack {
            Image(colorScheme == .light ? "iconLight" : "iconDark")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.3), radius: 5, x: 3, y: 3)
                .padding(.vertical, 10)
            
            
            VStack {
                Text("HayLingo")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("version: 1.0")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 20)
            
            
            VStack(spacing: 10) {
                InfoButton(icon: "arrow.up.right.square", title: "Show in AppStore") {
                    openAppStore()
                }
                InfoButton(icon: "star", title: "Rate the app") {
                    rateApp()
                }
                //                InfoButton(icon: "paperplane", title: "Telegram") {
                //                    print("Telegram tapped")
                //                }
                InfoButton(icon: "app.badge", title: "Our other apps") {
                    openOtherApps()
                }
                Spacer()
                InfoButton(icon: "trash", title: "Delete all data") {
                    deleteAllData()
                }
                .background(Color.red)
            }
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
        .background(Helper.ThemeColorManager.setColorInDarkMode(
            light: Helper.ColorHex.backgroundLightGray,
            dark: Helper.ColorHex.backgroundDarkGray,
            themeManager: themeManager,
            colorScheme: colorScheme)
        )
    }
    
    // Открыть приложение в App Store
    private func openAppStore() {
        guard let url = URL(string: "https://apps.apple.com/app/id\(Keys.appID)") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    // Поставить оценку приложению
    private func rateApp() {
        guard let url = URL(string: "https://apps.apple.com/app/id\(Keys.appID)?action=write-review") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    // Открыть другие приложения разработчика
    private func openOtherApps() {
        guard let url = URL(string: "https://apps.apple.com/developer/id\(Keys.devID)") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    // Удалить все данные пользователя
    private func deleteAllData() {
        // Показываем окно подтверждения
        let alert = UIAlertController(
            title: "Delete All Data",
            message: "Are you sure you want to delete all your progress data? This action cannot be undone.",
            preferredStyle: .alert
        )
        
        // Кнопка "Да" - очищаем данные
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
            self.clearProgressData()
            
            // Показываем уведомление о завершении действия
            self.showConfirmationAlert()
        }))
        
        // Кнопка "Нет" - отмена
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        // Показываем alert
        presentAlert(alert)
    }
    
    // Метод для очистки прогресса
    private func clearProgressData() {
        // Очищаем только данные прогресса: correctAnswer и totalQuestion
        for user in userData {
            for progress in user.progress {
                progress.correctAnswer = 0
                progress.totalQuestion = 0
            }
        }
        
        // Сохраняем изменения в контексте
        do {
            try context.save()
            print("Все данные о прогрессе были сброшены.")
        } catch {
            print("Ошибка при сохранении данных: \(error.localizedDescription)")
        }
    }
    
    // Метод для отображения confirmation alert
    private func showConfirmationAlert() {
        let confirmationAlert = UIAlertController(
            title: "Data Deleted",
            message: "Your progress data has been successfully deleted.",
            preferredStyle: .alert
        )
        confirmationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        presentAlert(confirmationAlert)
    }
    
    // Универсальный метод для отображения alert
    private func presentAlert(_ alert: UIAlertController) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            // Убедимся, что текущий контроллер не уже отображает alert
            DispatchQueue.main.async {
                if rootViewController.presentedViewController == nil {
                    rootViewController.present(alert, animated: true, completion: nil)
                } else {
                    print("Another alert is already being presented.")
                }
            }
        }
    }
}

struct InfoButton: View {
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    
    var icon: String
    var title: String
    var action: () -> Void
    
    
    var body: some View {
        Button(action: {
            Helper.SoundClick.triggerSound(userData: userData)
            Helper.Haptic.triggerVibration(userData: userData, style: .light)
            action()
        }) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 20))
                Text(title)
                    .fontWeight(.medium)
                    .font(.system(size: 18))
                Spacer()
            }
            .foregroundColor(.primary)
            .padding()
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    InfoView()
        .environmentObject(ThemeManager())
}
