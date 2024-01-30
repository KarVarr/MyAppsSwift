//
//  ClockView + Ext.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 30.01.2024.
//

import Foundation
import SwiftUI

extension ClockView {
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: Date())
    }
    
    func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: Date())
    }
    
    func textAndColor(name: String, color: UIColor) -> Text {
        return Text(name)
            .foregroundColor(Color(uiColor: color))
            .font(.system(size: fontSize, weight: .regular, design: .monospaced))
    }
    
    func generateHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
}
