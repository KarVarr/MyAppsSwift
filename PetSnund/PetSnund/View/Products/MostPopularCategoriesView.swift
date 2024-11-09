//
//  MostPopularCategoriesView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 09.11.2024.
//

import SwiftUI

struct MostPopularCategoriesView: View {
    @State private var selectedCategory: String = "All"
    let mostPopularCategories = ["All", "Cats", "Dogs", "Fish", "Reptiles", "Birds"]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Most Popular")
                    .font(.headline)
                    .bold()
                Spacer()
                Button {
                    
                } label: {
                    Text("See all")
                        .foregroundStyle(.orange)
                        .font(.subheadline)
                }
                
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(mostPopularCategories, id: \.self) { category in
                        Button {
                            
                        } label: {
                            Text(category)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedCategory == category ? Color.orange : Color(.systemGray5))
                                .foregroundStyle(selectedCategory == category ? .white : .black)
                                .cornerRadius(10)
                        }
                        
                    }
                }
                .padding(.horizontal)
                
            }
        }
        .padding(.top)
    }
}

#Preview {
    MostPopularCategoriesView()
}
