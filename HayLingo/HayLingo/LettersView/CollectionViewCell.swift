//
//  CollectionViewCell.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct CollectionViewCell: View {
    var index: Int
    var firstArmUppercaseLetter: String
    var secondArmLowercaseLetter: String
    var letterForStudy: String
    
    var body: some View {
        VStack {
            HStack {
                Text(firstArmUppercaseLetter)
                Text(secondArmLowercaseLetter)
            }
            
            Text(letterForStudy)
            
        }
        .padding() 
        .overlay {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Helper.ColorHex.darkGray, lineWidth: 1)
        }
    }
}

#Preview {
    CollectionViewCell(index: 1, firstArmUppercaseLetter: "A", secondArmLowercaseLetter: "a", letterForStudy: "A rus")
}
