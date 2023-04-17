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
        if times.count == 0 {
            ZStack {
                colorScheme == .dark ? Color(hex: 0x522546) : Color(hex: 0x99DDCC)
                VStack {
                    Image("WaitingPeach")
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .padding()
                    Text("Waiting for the first scores!")
                        .font(.title3)
                }
            }
            .ignoresSafeArea()
        } else {
            VStack {
                List {
                    Section {
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
                        
                    } header: {
                        Text("Best time")
                    }
                    .listRowBackground(colorScheme == .dark ? Color(hex: 0x88304E) : Color(hex: 0xFFE2E2))
                }
                .listStyle(.plain)
                .background(colorScheme == .dark ? Color(hex: 0x522546) : Color(hex: 0x99DDCC))
                .toolbar {
                    EditButton()
                }
            }
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
