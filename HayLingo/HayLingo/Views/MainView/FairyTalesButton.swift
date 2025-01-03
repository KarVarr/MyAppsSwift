//
//  FairyTalesButton.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct FairyTalesButton: View {
    let width: CGFloat
    let shadowColor: Color
    let userData: [UserData]
    
    var body: some View {
        NavigationLink(destination: TalesListView()) {
            VStackContent(
                title: NSLocalizedString("Armenian Fairy Tales", comment: ""),
                subtitle: nil,
                titleSize: 18,
                width: width,
                backgroundColor: Helper.ColorHex.red,
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


