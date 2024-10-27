//
//  CategoryCollectionView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 26.10.2024.
//

import SwiftUI

struct CategoryCollectionView: View {
    let petFoodCategories = [
        "Dry Food",
        "Wet Food",
        "Grain-Free",
        "Organic",
        "Freeze-Dried",
        "Raw Food",
        "Puppy Food",
        "Kitten Food",
        "Senior Food",
        "Prescription Diet",
        "Limited Ingredient",
        "High-Protein",
        "Weight Control",
        "Dental Health",
        "Sensitive Stomach",
        "Vegetarian",
        "Hypoallergenic",
        "Breed-Specific",
        "Training Treats",
        "Grain-Inclusive"
    ]
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Catalogue")
                    .font(.title)
                    .padding(.leading)
                Spacer()
            }

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 5) {
                ForEach(petFoodCategories, id: \.self) { index in
                    CategoryCollectionCellView(index: index)
                        .aspectRatio(1, contentMode: .fill)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CategoryCollectionView()
}
