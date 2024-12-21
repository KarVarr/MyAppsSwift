//
//  TaleDetailView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 21.12.2024.
//

import SwiftUI

struct TaleDetailView: View {
    let tale: Tale
    @State private var fontSize: CGFloat = 16
    @State private var isFavorite = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Заголовок и информация
                VStack(alignment: .leading, spacing: 8) {
                    Text(tale.title)
                        .font(.largeTitle)
                        .bold()
                    
                    if let author = tale.author {
                        Text("Հեղինակ՝ \(author)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Label("\(tale.timeToRead) րոպե", systemImage: "clock")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                .padding(.bottom)
                
                // Основной текст сказки
                Text(tale.content)
                    .font(.system(size: fontSize))
                    .lineSpacing(8)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                // Кнопка изменения размера шрифта
                Menu {
                    Button("Փոքր") { fontSize = 14 }
                    Button("Միջին") { fontSize = 16 }
                    Button("Մեծ") { fontSize = 20 }
                } label: {
                    Image(systemName: "textformat.size")
                }
            }
        }
    }
}

#Preview {
    TaleDetailView(tale: Tale(title: "title", content: "Content", author: "Author", timeToRead: 15))
}
