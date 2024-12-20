//
//  CollectionView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI


struct CollectionView: View {
    @State private var searchText: String = ""
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                CustomNavigationBar(searchText: $searchText)
                    .frame(height: geometry.size.height / 10)
                CollectionViewHorizontal()
                    .frame(height: geometry.size.height / 5)
                MostPopularCategoriesView()
                    .frame(height: geometry.size.height / 6)
                LazyVGrid(columns: columns) {
                    ForEach(0..<24) {index in
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
