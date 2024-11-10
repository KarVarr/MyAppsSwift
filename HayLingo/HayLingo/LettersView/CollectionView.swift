//
//  CollectionView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct CollectionView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    let englishAlphabet = Array("abcdefghijklmnopqrstuvwxyz")
    let armenianAlphabet = Array(arrayLiteral: "Ա", "Բ", "Գ", "Դ", "Ե", "Զ", "Է", "Ը", "Թ", "Ժ", "Ի", "Լ", "Խ", "Ծ", "Կ", "Հ", "Ձ", "Ղ", "Ճ", "Մ", "Յ", "Ն", "Շ", "Ո", "Չ", "Պ", "Ջ", "Ռ", "Ս", "Վ", "Տ", "Ր", "Ց", "Ւ", "Փ", "Ք", "Եվ", "Օ", "Ֆ")
    let armenianAlphabetLowercase = Array(arrayLiteral: "ա", "բ", "գ", "դ", "ե", "զ", "է", "ը", "թ", "ժ", "ի", "լ", "խ", "ծ", "կ", "հ", "ձ", "ղ", "ճ", "մ", "յ", "ն", "շ", "ո", "չ", "պ", "ջ", "ռ", "ս", "վ", "տ", "ր", "ց", "ւ", "փ", "ք", "և", "օ", "ֆ")
    let russianAlphabet = Array(arrayLiteral: "а", "б", "г", "д", "е", "з", "э", "ы – э", "т`", "ж", "и", "л", "х", "тц", "к", "h", "дз", "гх", "тч", "м", "й", "н", "ш", "во", "ч", "п", "дж", "р", "с", "в", "т", "р`", "ц", "у", "п`", "к`", "ев", "о", "ф")
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<armenianAlphabet.count, id: \.self) {index in
                    CollectionViewCell(
                        index: index,
                        firstArmUppercaseLetter: armenianAlphabet[index],
                        secondArmLowercaseLetter: armenianAlphabetLowercase[index],
                        letterForStudy: russianAlphabet[index]
                    )
                }
            }
        }
    }
}

#Preview {
    CollectionView()
}
