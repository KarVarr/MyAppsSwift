//
//  ProductsView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct ProductsView: View {
    @State private var searchText = ""
    
    var body: some View {
        CollectionView()
            .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    ProductsView()
}
