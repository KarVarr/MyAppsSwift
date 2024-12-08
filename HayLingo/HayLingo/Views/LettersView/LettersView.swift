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
                VStack(spacing: 16) {
                    if selectedLetters.isEmpty {
                        Text("Please select letters!")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.gray)
                            .padding(.bottom, 8)
                    } else {
                        Text("Now you can train!")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.gray)
                            .padding(.bottom, 8)
                    }
                    
                    NavigationLink(destination: LettersTrainerView(selectedLetters: $selectedLetters)
                        .onAppear {
                            selectedLetters = []
                        }) {
                            Text("Start game")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(selectedLetters.isEmpty ? .gray : .white)
                                .padding()
                                .frame(width: 270, height: 70)
                                .background {
                                    RoundedRectangle(cornerRadius: 35, style: .continuous)
                                        .fill(selectedLetters.isEmpty ? Color.gray.opacity(0.3) : Helper.ColorHex.lightOrange)
                                }
                        }
                        .disabled(selectedLetters.isEmpty)
                }
                .padding()
            }
            .background(Helper.ColorHex.backgroundLightGray)
        }
    }
}

#Preview {
    LettersView()
}


