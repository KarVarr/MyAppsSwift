//
//  TaleRowView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 21.12.2024.
//

import SwiftUI
import SwiftData

struct TaleRowView: View {
    @Environment(\.modelContext) var context
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var settingsManager = BaseSettingsManager.shared
    @Query var userData: [UserData]
    let tale: Tale
    
    var body: some View {
        NavigationLink {
            TaleDetailView(tale: tale)
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Text(tale.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                HStack {
                    Label("\(tale.timeToRead) minutes", systemImage: "clock")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("•")
                        .foregroundColor(.secondary)
                    
                    Text(tale.ageGroup.localizedString)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(tale.tags, id: \.self) { tag in
                            Text(tag)
                                .font(.caption2)
                                .foregroundColor(.primary)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Helper.ThemeColorManager.setColorInDarkMode(
                                    light: Color.blue.opacity(0.3),
                                    dark: Color.pink.opacity(0.3),
                                    themeManager: settingsManager,
                                    colorScheme: colorScheme
                                ))
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    TaleRowView(tale: Tale(
        title: "title",
        content: "test content",
        author: "author",
        timeToRead: 10,
        ageGroup: AgeGroup(rawValue: "1-3") ?? .defaultAgeGroup,
        tags: ["tag1", "tag2", "tag3"]
    ))
    .environmentObject(ThemeManager())
}
