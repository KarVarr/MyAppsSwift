//
//  SwiftUIView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(0..<20) {index in
                    Rectangle()
                        .foregroundStyle(.tint)
                        .frame(width: 100, height: 150)
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
