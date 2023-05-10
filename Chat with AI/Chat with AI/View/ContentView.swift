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
                    if string.hasPrefix("Me") {
                        HStack {
                            Spacer()
                            Text(string.replacingOccurrences(of: "Me:", with: ""))
                                .foregroundColor(.white)
                            Image(systemName: "person.fill")
                            
                        }
                        .padding(10)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                        .padding(.horizontal, 2)
                        
                    
                    } else {
                        HStack {
                            Image(systemName: "apple.logo")
                            Text(string.replacingOccurrences(of: "AI:", with: ""))
                                .monospaced()
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(10)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                        .padding(.horizontal, 2)
                        
                    }
                }
                
                
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            .padding(2)
            .listStyle(.plain)
            Spacer()
            
            
            ZStack {
                HStack {
                    TextField("Type Message", text: $text)
                    Button {
                        send()
                    } label: {
                        Image(systemName:"arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                            .font(.title.bold())
                            .padding(7)
                            .background(.blue)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                    .font(.title)
                    
                }
                .padding(.leading, 10)
                .padding(.trailing, 5)
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .stroke()
                    .fill(.gray.opacity(0.4))
                    .frame(height: 44)
                
            }
            .padding(.horizontal, 2)
           
            
        }
        .onAppear {
            viewModelOpenAI.setup()
        }
        .padding()
    }
    
    func send() {
        guard !text.isEmpty else { return }
        
        models.append("Me: "+text)
        viewModelOpenAI.send(text: text) { response in
            DispatchQueue.main.async {
                self.models.append("AI: "+response)
                self.text = ""
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
