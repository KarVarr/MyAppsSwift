//
//  ChatView.swift
//  Chat with AI
//
//  Created by Karen Vardanian on 11.05.2023.
//

import SwiftUI

struct ChatView: View {
    let textField = TextFieldView()
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                    textField.messageView(message: message)
                }
            }
            ZStack {
                HStack {
                    TextField("Type Message", text: $viewModel.currentInput)
                        .submitLabel(.done)
                    Button {
                        viewModel.sendMessage()
                    } label: {
                        Image(systemName:"arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                            .font(.title.bold())
                            .padding(7)
                            .background(.blue)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                    .font(.title)
                    
                }
                .padding(.leading, 10)
                .padding(.trailing, 5)
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .stroke()
                    .fill(.gray.opacity(0.4))
                    .frame(height: 44)
                
            }
            .padding(10)
        }
    }
    
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
