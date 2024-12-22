//
//  TaleDetailView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 21.12.2024.
//

import SwiftUI

struct TaleDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var themeManager: ThemeManager
    
    @State private var fontSize: CGFloat = 16
    @State private var displayedContent: String = ""
    let tale: Tale
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if displayedContent.isEmpty {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.secondary)
                        .padding()
                } else {
                    Text(tale.title)
                        .font(.largeTitle)
                        .bold()
                    
                    if let author = tale.author {
                        Text("Author՝ \(author)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Label("\(tale.timeToRead) minutes", systemImage: "clock")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Text(displayedContent)
                        .font(.system(size: fontSize))
                        .lineSpacing(8)
                        .animation(.easeInOut, value: displayedContent)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .background(
            Helper.ThemeColorManager.setColorInDarkMode(
                light: Helper.ColorHex.backgroundLightGray,
                dark: Helper.ColorHex.backgroundDarkGray,
                themeManager: themeManager,
                colorScheme: colorScheme
            )
            .ignoresSafeArea()
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if !displayedContent.isEmpty {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Small") { fontSize = 14 }
                        Button("Medium") { fontSize = 16 }
                        Button("Large") { fontSize = 20 }
                    } label: {
                        Image(systemName: "textformat.size")
                    }
                }
            }
        }
        .onAppear {
            loadContent()
        }
    }
    
    private func loadContent() {
        // Имитация загрузки данных
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
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
    .environmentObject(ThemeManager())
    
}
