//
//  CollectionViewHorizontal.swift
//  PetSnund
//
//  Created by Karen Vardanian on 02.11.2024.
//

import SwiftUI
import SwiftUIPager

struct CollectionViewHorizontal: View {
    @StateObject var page: Page = .first()
    var items = Array(0..<20)
    
    var body: some View {
        TabView {
            ForEach(1...6, id: \.self) { index in
                Image("scroll\(index)")
                    .resizable()
                    .scaledToFit()
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page)
    }
}


#Preview {
    CollectionViewHorizontal()
}


