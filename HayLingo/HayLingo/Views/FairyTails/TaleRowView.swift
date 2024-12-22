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
    @EnvironmentObject var themeManager: ThemeManager
    @Query var userData: [UserData]
    let tale: Tale
    @State private var isActive = false

    var body: some View {
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

                Text(tale.ageGroup.rawValue)
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
                                themeManager: themeManager,
                                colorScheme: colorScheme
                            ))
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding(.vertical, 4)
        .contentShape(Rectangle())
        .onTapGesture {
            Helper.SoundClick.triggerSound(userData: userData)
            Helper.Haptic.triggerVibration(userData: userData, style: .light)
            isActive = true
        }
        .background(
            NavigationLink(
                destination: TaleDetailView(tale: tale),
                isActive: $isActive,
                label: { EmptyView() }
            )
            .hidden() // Скрываем NavigationLink
        )
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
