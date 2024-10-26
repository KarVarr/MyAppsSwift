//
//  CollectionView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct CollectionView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            Image("dog2")
                .resizable()
                .frame(width: 200, height: 200)
            
            VStack {
                Text("Gav Gav My Friend")
                HStack {
                    Text("Welcome to")
                    Text("PetSnund")
                        .foregroundStyle(LinearGradient(colors: [.pink, .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .font(.largeTitle)
                }
            }
            .font(.title)
            LazyVGrid(columns: columns) {
                ForEach(0..<20) {index in
                    CollectionCellView(index: index)
                }
            }
        }
    }
}

#Preview {
    CollectionView()
}
