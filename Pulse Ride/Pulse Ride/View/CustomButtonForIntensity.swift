//
//  CustomButtonForIntensity.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 08.06.2023.
//

import SwiftUI

struct CustomButtonForIntensity: View {
    var action: () -> Void
    var imageName: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .padding(25)
                .foregroundColor(.pink)
                .background(Color.white.opacity(0.7))
                .clipShape(
                    Circle()
                )
        }

    }
}

struct CustomButtonForIntensity_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonForIntensity(action: {}, imageName: "rabit")
    }
}
