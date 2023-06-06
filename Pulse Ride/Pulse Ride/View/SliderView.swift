//
//  SliderView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 31.05.2023.
//

import SwiftUI

struct SliderView: View {
    @State var percentage: Float = 0.5
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                SliderShapeView()
//                    .foregroundColor(.white.opacity(0.4))
                    .foregroundColor(.gray)
                    .mask(SliderShapeView())
                Rectangle()
                    .foregroundColor(.orange)
//                    .foregroundColor(.white.opacity(0.8))
                    .frame(width: geo.size.width * CGFloat(self.percentage / 1.0))
                    
            }
            .cornerRadius(12)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    self.percentage = min(max(0, Float(value.location.x / geo.size.width * 1.0)), 1.0)
                }))
        }
        
        

        
    }
    
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
