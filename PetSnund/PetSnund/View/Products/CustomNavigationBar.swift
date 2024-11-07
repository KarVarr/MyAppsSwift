//
//  CustomNavigationBar.swift
//  PetSnund
//
//  Created by Karen Vardanian on 07.11.2024.
//

import SwiftUI

struct CustomNavigationBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            // Поле поиска
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search Categories", text: $searchText)
                    .foregroundColor(.primary)
            }
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            
            Spacer()
            
            Button(action: {
                // Действие для кнопки избранного
            }) {
                ZStack {
                    Image(systemName: "heart")
                        .font(.system(size: 20))
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                        .offset(x: 10, y: -10)
                }
            }
            .padding(.leading)
            
            
            Button(action: {
                // Действие для кнопки уведомлений
            }) {
                ZStack {
                    Image(systemName: "bell")
                        .font(.system(size: 20))
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                        .offset(x: 10, y: -10)
                }
            }
            .padding(.leading)
        }
        .padding()
    }
}

#Preview {
    CustomNavigationBar(searchText: .constant("Test search"))
}
