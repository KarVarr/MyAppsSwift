//
//  ContentView.swift
//  Chat with AI
//
//  Created by Karen Vardanian on 09.05.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModelOpenAI = ViewModelOpenAI()
    @State private var text = ""
    @State private var models = [String]()
    
    var body: some View {
        VStack {
            List {
                ForEach(models, id: \.self) { string in
                    Text(string)
                }
                
                Spacer()
                
                HStack {
                    TextField("Type here...", text: $text)
                    Button("Send") {
                        send()
                    }
                }
            }
        }
    }
    
    func send() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
