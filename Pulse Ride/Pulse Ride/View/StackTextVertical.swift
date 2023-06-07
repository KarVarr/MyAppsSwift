//
//  StackTextVertical.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 07.06.2023.
//

import SwiftUI

struct StackTextVertical: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(subtitle)
                .font(.title3)
                .foregroundColor(.white.opacity(0.5))
        }
    }
}

struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        StackTextVertical(title: "title", subtitle: "subtitle")
    }
}
