//
//  CollectionCellView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct CollectionCellView: View {
    var index: Int
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image("food1")
                    .resizable()
                    .scaledToFill()
                
                Image(systemName: "suit.heart")
                    .resizable()
                    .foregroundStyle(.pink)
                    .frame(width: 30, height: 30)
                    .padding([.top, .trailing], 10)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Circle()
                        .foregroundStyle(.pink)
                        .frame(width: 30, height: 30)
                        .overlay(
                            Image(systemName: "percent")
                                .foregroundStyle(.white)
                        )
                    Text("4500 dram")
                        .foregroundStyle(.pink)
                }
                
                Text("Royal Canin 20kg")
                Text("Dogs food")
                
                Button(action: {}) {
                    Text("Add to basket")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .frame(width: 210, height: 400)
        .background(Color.white)
        .cornerRadius(10)
        .onTapGesture {
            print("Tapped cell \(index)")
        }
    }
}


#Preview {
    CollectionCellView(index: 1)
}
