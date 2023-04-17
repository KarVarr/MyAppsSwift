//
//  ScoreView.swift
//  MindGrid
//
//  Created by Karen Vardanian on 13.04.2023.
//

import SwiftUI



struct ScoreView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Score.time, ascending: true)]) var times: FetchedResults<Score>
    
    let date = Date()
    
    
    
    var body: some View {
        
        VStack {
            List {
                Section {
                    if times.count < 1 {
                        GeometryReader { geo in
                            VStack (alignment: .center){
                                Image("WaitingPeach")
                                    .padding()
                                     
                                Text("Waiting for the first scores!")
                                    .font(.title3)
                                    .padding(.bottom, 30)
                                
                                Text("Here will be your time for passing this test in order to compare the result in the future!")
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(width: geo.size.width, height: 500 )
                        }
                        .listRowBackground(colorScheme == .dark ? Color(hex: 0x522546) : Color(hex: 0x99DDCC))
                        .listRowSeparator(.hidden)
                        
                    } else {
                        ForEach(times) { score in
                            HStack {
                                Text(String(format: "%02d:%02d", score.time / 60, score.time % 60))
                                    .font(.system(size: 24, design: .monospaced))
                                    .padding(.horizontal, 5)
                                
                                Spacer()
                                
                                Text( String((score.date?.formatted(.dateTime.day().month().year())) ?? "N\\A") )
                                
                            }
                        }
                        .onDelete(perform: removeScore)
                        
                    }
                    
                } header: {
                    Text("Best time")
                        .font(.largeTitle)
                }
                .listRowBackground(colorScheme == .dark ? Color(hex: 0x88304E) : Color(hex: 0xFFE2E2))
            }
            .listStyle(.plain)
            .background(colorScheme == .dark ? Color(hex: 0x522546) : Color(hex: 0x99DDCC))
            
            
            
            
        }
        
    }
    
    
    func removeScore(at offsets: IndexSet) {
        for index in offsets {
            let score = times[index]
            moc.delete(score)
        }
        
        try? moc.save()
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
