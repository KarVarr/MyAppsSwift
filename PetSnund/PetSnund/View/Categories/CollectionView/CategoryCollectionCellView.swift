//
//  CategoryCollectionCellView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 26.10.2024.
//

import SwiftUI

struct CategoryCollectionCellView: View {
    var index: String
    var body: some View {
        VStack {
            Text("\(index)")
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .cornerRadius(10)
    }
}

#Preview {
    CategoryCollectionCellView(index: "food")
}
