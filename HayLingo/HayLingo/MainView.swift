//
//  MainView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView{
            Text("HayLingo")
            
            VStack{
                Text("Your language learning app")
                    .font(.headline)
                Text("English")
                    .font(.subheadline)
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

#Preview {
    MainView()
}
