//
//  SettingView.swift
//  MindGrid
//
//  Created by Karen Vardanian on 13.04.2023.
//

import SwiftUI

struct SettingView: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Group {
                Text("Schulte table:")
                    .font(.largeTitle)
                Text("A Schulte table is a grid with randomly distributed numbers or letters used for development of speed reading, peripheral vision, attention and visual perception.")
                    .font(.title3)
            }
            .padding(.bottom, 10)
            
            Group {
                Text("Description:")
                    .font(.largeTitle)
                Text("Generally 5x5 table used, while there are possible variations with different dimensions, coloured cells and values. Focus on the grid centre and find all the numbers (letters) with your peripheral vision, i.e. without moving your eyes.")
                    .font(.title3)
            }
            .padding(.bottom, 10)
            Text("History:")
                .font(.largeTitle)
            Text("The Schulte Table was developed originally as a psycho-diagnostic test to study the properties of attention, by German psychiatrist and psychotherapist Walter Schulte (1910 — 1972).")
                .font(.title3)
        }
        .padding(16)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
