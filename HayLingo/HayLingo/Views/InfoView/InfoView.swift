//
//  InfoView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 09.12.2024.
//

import SwiftUI
import SwiftData

struct InfoView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var themeManager: ThemeManager
    
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
                    print("Show in AppStore tapped")
                }
                InfoButton(icon: "star", title: "Rate the app") {
                    print("Rate the app tapped")
                }
                InfoButton(icon: "paperplane", title: "Telegram") {
                    print("Telegram tapped")
                }
                InfoButton(icon: "app.badge", title: "Our other apps") {
                    print("Other apps tapped")
                }
                Spacer()
                InfoButton(icon: "trash", title: "Delete all data") {
                    print("Deleted all data")
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
