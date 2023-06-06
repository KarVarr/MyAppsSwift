//
//  SliderView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 31.05.2023.
//

import SwiftUI

struct SliderView: View {
    @State var value: Double = 5
    @State var percentage: Float = 0.5
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray)
                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(width: geo.size.width * CGFloat(self.percentage / 1.0))
            }
            .cornerRadius(12)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    self.percentage = min(max(0, Float(value.location.x / geo.size.width * 1.0)), 1.0)
                }))
        }
        .frame(width: 200, height: 44)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
