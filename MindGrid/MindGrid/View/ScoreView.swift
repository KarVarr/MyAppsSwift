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
    
//    @State private var time = [35, 79, 25, 104]
    
    var body: some View {
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
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
