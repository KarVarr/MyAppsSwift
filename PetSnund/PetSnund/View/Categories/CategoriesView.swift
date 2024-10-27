//
//  CategoriesView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        VStack {
            CategoryCollectionView()
        }
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    CategoriesView()
}
