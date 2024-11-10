//
//  LettersView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct LettersView: View {
    
    
    var body: some View {
        ScrollView {
            Text("աբ".uppercased())
                .font(.title)
            
            VStack {
                Text("dd")
            }
            .frame(width: 100, height: 100)
            .overlay {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.gray, lineWidth: 2)
            }
        }
    }
}

#Preview {
    LettersView()
}
