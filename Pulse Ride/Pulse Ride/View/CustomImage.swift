//
//  CustomImage.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 07.06.2023.
//

import SwiftUI

struct CustomImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 35, height: 35)
            .opacity(0.8)
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(imageName: "snail1")
    }
}
