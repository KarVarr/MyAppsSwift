//
//  InfoView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 09.12.2024.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Info view")
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Helper.ColorHex.backgroundLightGray)
    }
}

#Preview {
    InfoView()
}
