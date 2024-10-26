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
            Text("Cell \(index)")
                .font(.headline)
                .foregroundStyle(.primary)
            Spacer()
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
