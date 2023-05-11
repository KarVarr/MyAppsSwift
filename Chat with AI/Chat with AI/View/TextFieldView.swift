//
//  TextFieldView.swift
//  Chat with AI
//
//  Created by Karen Vardanian on 11.05.2023.
//

import SwiftUI

class TextFieldView {
        func messageView(message: Message) -> some View {
            HStack {
                if message.role == .user { Spacer() }
                Text(message.content)
                    .foregroundColor(message.role == .user ? .white : .black)
                    .padding()
                    .background(message.role == .assistant ? .blue : .green.opacity(0.4))
                .cornerRadius(16)
                if message.role == .assistant { Spacer() }
            }
            .padding(.horizontal, 10)
        }
}
