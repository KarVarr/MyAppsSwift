//
//  SettingsButton.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct SettingsButton: View {
    let width: CGFloat
    let shadowColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStackContent(
                title: NSLocalizedString("Settings", comment: ""),
                subtitle: nil,
                titleSize: 18,
                width: width,
                backgroundColor: Helper.ColorHex.blue,
                textColor: Helper.ColorHex.white,
                spacing: 1,
                alignment: .center,
                shadowColor: shadowColor
            )
        }
    }
}


