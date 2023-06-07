//
//  CustomRectangleForAnimation.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 07.06.2023.
//

import SwiftUI

struct CustomRectangleForAnimation: View {
    var width: CGFloat?
    var height: CGFloat?
    var color: Color?
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .cornerRadius(10)
            .foregroundColor(color)
    }
}

struct CustomRectangleForAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CustomRectangleForAnimation()
    }
}
