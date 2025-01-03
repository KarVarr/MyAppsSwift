//
//  StudyButton.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct StudyButton: View {
    let width: CGFloat
    let shadowColor: Color
    let userData: [UserData]
    
    var body: some View {
        NavigationLink(destination: LettersView()) {
            VStackContent(
                title: NSLocalizedString("Study", comment: ""),
                subtitle: nil,
                titleSize: 18,
                width: width,
                backgroundColor: Helper.ColorHex.orange,
                textColor: Helper.ColorHex.white,
                spacing: 1,
                alignment: .center,
                shadowColor: shadowColor
            )
        }
        .simultaneousGesture(
            TapGesture().onEnded({
                Helper.SoundClick.triggerSound(userData: userData)
                Helper.Haptic.triggerVibration(userData: userData, style: .light)
            })
        )
    }
}
