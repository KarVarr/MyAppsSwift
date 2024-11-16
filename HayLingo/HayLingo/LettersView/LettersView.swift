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
    
    //    @StateObject private var viewModel = LetterTrainerViewModel()
    @State private var selectedLetters: [String] = []
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                CollectionView(selectedLetters: $selectedLetters)
                VStack {
                    NavigationLink(destination: LetterTrainerView(selectedLetters: $selectedLetters)) {
                        Text("Start Game \(selectedLetters)")
                    }
                    NavigationLink(destination: SelectedLettersView(letters: selectedLetters)) {
                        Text("Start Game \(selectedLetters)")
                    }
                }
            }
        }
    }
}

#Preview {
    LettersView()
}

