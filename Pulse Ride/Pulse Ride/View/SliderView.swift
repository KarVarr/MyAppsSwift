//
//  SliderView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 31.05.2023.
//

import SwiftUI

struct SliderView: View {
    @Binding var percentage: Float
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.white.opacity(0.4))
                Rectangle()
                    .foregroundColor(.white.opacity(0.8))
                    .frame(width: geo.size.width * CGFloat((self.percentage - 0.1) / 1.0))
                    
            }
            .shadow(radius: 5)
            .cornerRadius(12)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    self.percentage = min(max(0, Float(value.location.x / geo.size.width * 1.0 + 0.1)), 1.0)
                }))
        }
        .shadow(radius: 4)
        
        

        
    }
    
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(percentage: .constant(0.5))
    }
}
