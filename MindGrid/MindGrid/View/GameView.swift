//
//  GameView.swift
//  MindGrid
//
//  Created by Karen Vardanian on 13.04.2023.
//

import SwiftUI

struct GameView: View {
    @State private var symbolToFind = 1
    let numbersForSymbol = (1...25)
    
//    let columns = [
//        GridItem(.fixed(70), spacing: 10),
//        GridItem(.fixed(70), spacing: 10),
//        GridItem(.fixed(70), spacing: 10),
//        GridItem(.fixed(70), spacing: 10),
//        GridItem(.fixed(70), spacing: 10),
//    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 70), spacing: 5),
    ]
    
    var body: some View {
        VStack {
            Group {
                Text("Symbol to find:")
                
                ZStack {
                    Text("\(symbolToFind)")
                        .padding(.vertical, 50)
                    Circle()
                        .stroke()
                        .foregroundColor(.green)
                        .frame(width: 100)
                }
                Text("00:10")
                    .font(.system(size: 26))
            }
            .font(.custom("Copperplate", size: 38))
            
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(numbersForSymbol, id: \.self) { item in
                    Text(String(item))
                        .font(.system(size: 44))
                        .fontWeight(.bold)
                        .frame(width: 75, height: 70)
                        .background(.mint)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
//                        .clipShape(Circle())
                        .shadow(radius: 4)
                    
                }
                
            }
            .padding(.top, 100)
            
        }
        .padding(10)

    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
