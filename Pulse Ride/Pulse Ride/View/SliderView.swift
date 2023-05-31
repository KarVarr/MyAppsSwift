//
//  SliderView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 31.05.2023.
//

import SwiftUI

struct SliderView: View {
    @State var value: Double = 5
    
    var body: some View {
        VStack {
            Slider(value: $value, in: 0...10)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
