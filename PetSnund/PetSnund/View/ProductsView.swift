//
//  ProductsView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct ProductsView: View {
    var body: some View {
        VStack{
            CollectionView()
                .padding(.horizontal, 10)
        }
        .background(Color.white)
    }
}

#Preview {
    ProductsView()
}
