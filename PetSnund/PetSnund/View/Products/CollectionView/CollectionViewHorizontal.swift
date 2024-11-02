//
//  CollectionViewHorizontal.swift
//  PetSnund
//
//  Created by Karen Vardanian on 02.11.2024.
//

import SwiftUI

struct CollectionViewHorizontal: View {
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: columns) {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .foregroundStyle(.blue)
                            .frame(width: geometry.size.width - 20,height: geometry.size.height / 5)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

#Preview {
    CollectionViewHorizontal()
}
