//
//  InfoButtonView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct InfoButtonView: View {
    let userData: [UserData]
    @Binding var isPresented: Bool
    
    var body: some View {
        Button {
            Helper.SoundClick.triggerSound(userData: userData)
            Helper.Haptic.triggerVibration(userData: userData, style: .light)
            isPresented = true
        } label: {
            Image(systemName: "info.circle")
        }
        .padding(.bottom, 20)
        .sheet(isPresented: $isPresented) {
            InfoView()
        }
    }
}
