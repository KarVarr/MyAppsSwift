//
//  CollectionViewCell.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct CollectionViewCell: View {
    var backgroundColor: Color
    var index: Int
    var firstArmUppercaseLetter: String
    var secondArmLowercaseLetter: String
    var letterForStudy: String
    
    var body: some View {
        VStack {
            HStack {
                Text(firstArmUppercaseLetter)
                    .font(.title)
                    .foregroundStyle(Helper.ColorHex.white)
                Text(secondArmLowercaseLetter)
                    .font(.title2)
                    .foregroundStyle(Helper.ColorHex.white.opacity(0.8))
            }
            
            Text(letterForStudy)
                .font(.largeTitle)
                .foregroundStyle(Helper.ColorHex.blue)
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

#Preview {
    CollectionViewCell(backgroundColor: Color.white, index: 1, firstArmUppercaseLetter: "A", secondArmLowercaseLetter: "a", letterForStudy: "A rus")
}
