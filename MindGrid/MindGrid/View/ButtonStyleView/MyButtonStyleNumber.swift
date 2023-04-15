//
//  MyButtonStyleNumber.swift
//  MindGrid
//
//  Created by Karen Vardanian on 14.04.2023.
//
import CoreHaptics
import SwiftUI


struct MyButtonStyleNumber: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 44))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .frame(minWidth: 45, maxWidth: 70, minHeight: 50, maxHeight: 70)
            .background(.mint)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(radius: 4)
            .onTapGesture(perform: successTapped)
    }
    
    func errorTapped() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    func successTapped() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
}
