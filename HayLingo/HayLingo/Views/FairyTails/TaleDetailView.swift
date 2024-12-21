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
    @State private var displayedContent: String = "Загрузка..."
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Заголовок сказки
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
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                // Основной текст сказки
                Text(displayedContent)
                    .font(.system(size: fontSize))
                    .lineSpacing(8)
                    .animation(.easeInOut, value: displayedContent) // Анимация для плавного появления текста
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
        .onAppear {
            loadContent()
        }
    }
    
    private func loadContent() {
        // Имитация загрузки данных
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            DispatchQueue.main.async {
                self.displayedContent = tale.content
            }
        }
    }
}


#Preview {
    TaleDetailView(
        tale: Tale(
            title: "title",
            content: "test content",
            author: "author",
            timeToRead: 10,
            ageGroup: AgeGroup(rawValue: "1-3") ?? .defaultAgeGroup,
            tags: ["tag1", "tag2", "tag3"]
        )
    )
}
