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
    @FetchRequest(sortDescriptors: []) var times: FetchedResults<Score>
    
    
    var body: some View {
        if times.count == 0 {
            ZStack {
                Color(hex: 0xc4d9ee)
                VStack {
                    Image("WaitingScore")
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
                                Text("1 sep 2023, 20:46")
                                Spacer()
                                switch score.time {
                                case 0..<15: Text("🟢")
                                case 15..<60: Text("🟡")
                                case 60..<120: Text("🟠")
                                default: Text("🔴")
                                }
                                
                            }
                        }
                        .onDelete(perform: removeScore)
                        HStack {
                            Text("1:56")
                            Text("1 sep 2023, 20:46")
                            Spacer()
                            Text("🟡")
                        }
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
