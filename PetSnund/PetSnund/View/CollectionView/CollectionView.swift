//
//  CollectionView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct CollectionView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            Image("dog2")
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("Gav Gav My Friend")
            Text("Welcome to PetSnund")
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<20) {index in
                    CollectionCellView(index: index)
                        .frame(width: 110, height: 150)
                }
            }
        }
    }
}

#Preview {
    CollectionView()
}
