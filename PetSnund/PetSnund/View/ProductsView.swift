//
//  ProductsView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct ProductsView: View {
    var body: some View {
        Image("dog1")
            .resizable()
            .frame(width: 200, height: 200)
        
        Text("Gav Gav My Friend")
        Text("Welcome to PetSnund")
        List {
            Text("Dog")
            Text("Cat")
            Text("Bird")
        }
        .listStyle(.plain)
        
    }
}

#Preview {
    ProductsView()
}
