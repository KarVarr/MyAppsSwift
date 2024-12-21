//
//  TalesListView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct TalesListView: View {
    let tales = FairyTales.getAllTales()
    
    var body: some View {
        NavigationView {
            List(tales, id: \.id) { tale in
                NavigationLink(destination: TaleDetailView(tale: tale)) {
                    TaleRowView(tale: tale)
                }
            }
        }
    }
}

#Preview {
    TalesListView()
}
