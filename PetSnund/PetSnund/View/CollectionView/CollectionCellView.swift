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
            VStack {
                ZStack {
                    Image("food1")
                        
                    HStack {
                        Image(systemName: "suit.heart.fill")
                            .foregroundStyle(.white)
                    }
                }
            }
            Spacer()
            HStack {
                ZStack {
                    Circle()
                        .foregroundStyle(.pink)
                    Image(systemName: "percent")
                        .foregroundStyle(.white)
                }
                .frame(width: 30)
                
                Text("4500 dram")
                    .foregroundStyle(.pink)
            }
            Text("Monge Simba 20kg")
            Text("Dogs food")
            
            
            Button(action: {}) {
                Text("Add to basket")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .cornerRadius(10)
        .onTapGesture {
            print("Tapped cell \(index)")
        }
    }
}

#Preview {
    CollectionCellView(index: 1)
}
