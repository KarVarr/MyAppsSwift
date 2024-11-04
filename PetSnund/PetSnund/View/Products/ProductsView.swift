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
        NavigationStack {
            CollectionView()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            
                        } label: {
                            Image(systemName: "map.fill")
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Pet Snund")
                            .font(.title)
                            .foregroundStyle(.primary)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "gear")
                        }
                        
                    }
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
        }
        .background(Color.gray.opacity(0.1))
        .searchable(text: $searchText, prompt: "Look for best products")
    }
}

#Preview {
    ProductsView()
}
