//
//  InfoActionButton.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI
import SwiftData

struct InfoActionButton: View {
    @Query var userData: [UserData]
    
    let icon: String
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    init(
        icon: String,
        title: String,
        backgroundColor: Color = Color.gray.opacity(0.2),
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.title = title
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
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
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

