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
            Text(tale.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            HStack {
                Label("\(tale.timeToRead) րոպե", systemImage: "clock")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("•")
                    .foregroundColor(.secondary)
            }
            
            // Теги
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack {
//                    ForEach(tale.tags, id: \.self) { tag in
//                        Text(tag)
//                            .font(.caption2)
//                            .padding(.horizontal, 8)
//                            .padding(.vertical, 4)
//                            .background(Color.blue.opacity(0.1))
//                            .cornerRadius(8)
//                    }
//                }
//            }
        }
        .padding(.vertical, 4)
    }
}


#Preview {
    TaleRowView(tale: Tale(title: "title", content: "test content", author: "author", timeToRead: 10))
}
