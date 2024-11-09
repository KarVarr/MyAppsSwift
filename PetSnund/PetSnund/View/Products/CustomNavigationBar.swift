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
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search Categories", text: $searchText)
                    .foregroundColor(.gray)
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
                        .frame(width: 10, height: 10)
                        .offset(x: 8, y: -8)
                }
            }
            .padding()
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.gray, lineWidth: 1)
            }
            
            Button(action: {
                // Действие для кнопки уведомлений
            }) {
                ZStack {
                    Image(systemName: "bell")
                        .font(.system(size: 20))
                    Circle()
                        .fill(Color.red)
                        .frame(width: 10, height: 10)
                        .offset(x: 8, y: -8)
                }
            }
            .padding()
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.gray, lineWidth: 1)
            }
        }
        .frame(maxHeight: 60)
        .padding()
        
    }
}

#Preview {
    CustomNavigationBar(searchText: .constant("Test search"))
}
