//
//  CurrentLetterView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 14.11.2024.
//

import SwiftUI

struct CurrentLetterView: View {
    let letter: String
//    let image: String
    
    var body: some View {
        HStack {
            Text(letter)
                .font(Font.system(size: 72))
                .foregroundStyle(Helper.ColorHex.red)
            Spacer()
//            Image(image)
//                .resizable()
//                .scaledToFit()
//                .padding()
//                .foregroundStyle(Helper.ColorHex.blue)
        }
        .foregroundStyle(.black)
    }
}

#Preview {
//    CurrentLetterView(letter: "A", image: "Օ")
    CurrentLetterView(letter: "A")
}
