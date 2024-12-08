//
//  ExtensionView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 08.12.2024.
//

import Foundation
import SwiftUI

extension View {
    func settingsContainerStyle(width: CGFloat) -> some View {
        self
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.horizontal, 10)
    }
}
