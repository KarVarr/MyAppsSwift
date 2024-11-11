//
//  LettersView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct LettersView: View {
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            CollectionView()
        }
    }
}

#Preview {
    LettersView()
}
