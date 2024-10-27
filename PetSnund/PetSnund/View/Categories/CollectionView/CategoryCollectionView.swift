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
            Text("All categories of feed")
                .font(.title)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(petFoodCategories, id: \.self) { index in
                    CategoryCollectionCellView(index: index)
                        .frame(width: 100, height: 100)
                }
            }
        }
    }
}

#Preview {
    CategoryCollectionView()
}
