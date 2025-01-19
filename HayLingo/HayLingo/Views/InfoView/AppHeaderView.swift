//
//  AppHeaderView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct AppHeaderView: View {
    var body: some View {
        VStack {
            Text("HayLingo")
                .font(.title2)
                .fontWeight(.semibold)
            Text("version: 1.0.2")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding(.bottom, 20)
    }
}


#Preview {
    AppHeaderView()
}
