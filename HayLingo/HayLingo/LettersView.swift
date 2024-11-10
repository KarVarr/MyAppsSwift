//
//  LettersView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct LettersView: View {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz".uppercased())
    let armenianAlphabet = Array("աբգդեզէըթժիլխծկհձղճմնոջրստվտրււփքր".uppercased())
    let russianAlphabet = Array("абвгдеёжзийклмнопрстуфхцчшщъыьэюя".uppercased())
    let arabicAlphabet = Array("أإأؤإئابتثجحخدذرزسشصضطظعغفقكلمنهويي".uppercased())
    
    var body: some View {
        Text("HayLingo")
            .font(.title)
        
        VStack {
            Text("A")
        }
        .frame(width: 100, height: 100)
        .overlay {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(.gray, lineWidth: 2)
        }
    }
}

#Preview {
    LettersView()
}
