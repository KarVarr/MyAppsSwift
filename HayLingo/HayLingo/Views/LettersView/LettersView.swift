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
                    NavigationLink(destination: LettersTrainerView(selectedLetters: $selectedLetters)
                        .onAppear {selectedLetters = []
                        }) {
                            ZStack(alignment: .leading) {
                                Text("Start")
                                    .font(.system(size: 24, weight: .semibold))
                                    .padding(16)
                                    .frame(width: 270, height: 70)
                                    .background {
                                        RoundedRectangle(cornerRadius: 35, style: .continuous)
                                            .stroke(.black, lineWidth: 10)
                                    }
                                    .foregroundStyle(.red)
                            }
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

