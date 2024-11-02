//
//  CollectionView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct CollectionView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            CollectionViewHorizontal()
                .padding()
            LazyVGrid(columns: columns) {
                ForEach(0..<20) {index in
                    CollectionCellView(index: index)
                }
            }
        }
    }
}

#Preview {
    CollectionView()
}
