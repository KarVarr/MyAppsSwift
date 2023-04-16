//
//  ScoreView.swift
//  MindGrid
//
//  Created by Karen Vardanian on 13.04.2023.
//

import SwiftUI



struct ScoreView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var times: FetchedResults<Score>
    
//    @State private var time = [35, 79, 25, 104]
    
    var body: some View {
        VStack {
            Text("Best score \(times.count)")
            List {
                ForEach(times) { score in
                    Text(String(format: "%02d:%02d", score.time / 60, score.time % 60))
                }
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
