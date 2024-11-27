//
//  LettersView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI
import SwiftData

struct LettersView: View {
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    
    @State private var selectedLetters: [String] = []
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                CollectionView(selectedLetters: $selectedLetters)
                VStack {
                    NavigationLink(destination: LettersTrainerView()) {
                        Text("Start Game \(selectedLetters)")
//                    NavigationLink(destination: LettersTrainerView(selectedLetters: $selectedLetters)) {
//                        Text("Start Game \(selectedLetters)")
                    }
                }
            }
            .background(Helper.ColorHex.backgroundGray)
        }
    }
}

#Preview {
    LettersView()
}

