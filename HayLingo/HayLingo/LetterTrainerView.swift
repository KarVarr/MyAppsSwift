//
//  LetterTrainerView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 13.11.2024.
//

import SwiftUI

struct LetterTrainerView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                
                VStack {
                    HStack {
                        Text("Aa")
                            .font(Font.system(size: 72))
                            .foregroundStyle(Helper.ColorHex.red)
                            .padding()
                        Spacer()
                        Image(systemName: "dog")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .foregroundStyle(Helper.ColorHex.blue)
                    }
                    .foregroundStyle(.black)
                    .padding()
                    .frame(maxWidth: geometry.size.width - 20, minHeight: geometry.size.height / 4, maxHeight: geometry.size.height / 4)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Helper.ColorHex.white)
                            .shadow(radius: 10)
                    )
                    Spacer()
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 1)) {
                        ForEach(0...3, id: \.self) { text in
                            VStack {
                                Text("hh")
                                    .font(Font.system(size: 64))
                                    .foregroundStyle(.white)
                                    .frame(minWidth: geometry.size.width / 2.6, maxWidth: geometry.size.width - 20, minHeight: geometry.size.height / 8, maxHeight: geometry.size.height / 10, alignment: .center)
                                    .background {
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(Helper.ColorHex.orange)
                                    }
                            }
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
        .background(Helper.ColorHex.backgroundGray)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LetterTrainerView()
}
