//
//  MainView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                Text("HayLingo")
                    .foregroundLinearGradientArmenianFlag(colors: [.red, .red, .blue, .orange, .orange], startPoint: .top, endPoint: .bottom)
                    .frame(height: geometry.size.height / 6)
                    .font(.system(size: 72, weight: .bold, design: .monospaced))
                
                
                VStack{
                    Button {
                        print("your language")
                    } label: {
                        Text("Your language learning app")
                            .font(.headline)
                        Text("English")
                            .font(.subheadline)
                    }
                    .buttonStyle(.bordered)
                }
                
                
                VStack{
                    Text("Information about your previous lessons")
                    Text("Language: English")
                    Text("Correct answers: 10/10")
                    
                }
                
                VStack{
                    Text("Your progress")
                    Text("10/10")
                }
                
                VStack{
                    Text("History of Armenian language")
                }
                
                VStack{
                    Text("Play game")
                }
            }
        }
    }
}

#Preview {
    MainView()
}
