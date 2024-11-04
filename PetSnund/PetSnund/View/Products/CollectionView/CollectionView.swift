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
        GeometryReader { geometry in
            
            ScrollView {
                CollectionViewHorizontal()
                    .frame(height: geometry.size.height / 4)
                LazyVGrid(columns: columns) {
                    ForEach(0..<40) {index in
                        CollectionCellView(index: index)
                    }
                }
            }
        }
    }
}

#Preview {
    CollectionView()
}
