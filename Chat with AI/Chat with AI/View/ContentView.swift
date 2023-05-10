//
//  ContentView.swift
//  Chat with AI
//
//  Created by Karen Vardanian on 09.05.2023.
//
import OpenAISwift
import SwiftUI



struct ContentView: View {
    @ObservedObject var viewModelOpenAI = ViewModelOpenAI()
    @State private var text = ""
    @State private var models = ["Me: Hello", "AI: Hi! How i can help you?"]
    
    
    var body: some View {
        NavigationView {
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
                            .background(.purple)
                            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                            
                            
                            
                        } else {
                            HStack {
                                Image(systemName: "apple.logo")
                                Text(string.replacingOccurrences(of: "AI:", with: ""))
                                    .monospaced()
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(10)
                            .background(.cyan)
                            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                            
                            
                        }
                    }
                    
                    .listRowSeparator(.hidden)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
                .padding(2)
                .listStyle(.plain)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                .scrollDismissesKeyboard(.immediately)
                Spacer()
                
                
                ZStack {
                    HStack {
                        TextField("Type Message", text: $text)
                            .submitLabel(.done)
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
                .navigationTitle("Chat")
            }
           
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
