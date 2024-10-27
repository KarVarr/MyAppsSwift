//
//  CategoryCollectionCellView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 26.10.2024.
//

import SwiftUI

struct CategoryCollectionCellView: View {
    let colors = [Color.blue, Color.red, Color.green, Color.yellow, Color.orange, Color.purple, Color.pink, Color.gray, Color.black]
    
    var index: String
    
    var body: some View {
        VStack {
            Text("\(index)")
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(colors.randomElement())
        .cornerRadius(10)
    }
}

#Preview {
    CategoryCollectionCellView(index: "food")
}
