//
//  TaleRowView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 21.12.2024.
//

import SwiftUI

struct TaleRowView: View {
    let tale: Tale
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(tale.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("•")
                    .foregroundColor(.secondary)
                
                Text(tale.author ?? "no author")
                    .font(.caption)
                    .foregroundStyle(.primary)
            }
            HStack {
                Label("\(tale.timeToRead) րոպե", systemImage: "clock")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
            }
        }
        .padding(.vertical, 4)
    }
}


#Preview {
    TaleRowView(tale: Tale(title: "title", content: "test content", author: "author", timeToRead: 10))
}
