//
//  Helper.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 20.01.2024.
//

import UIKit
import Foundation
import SwiftUI

enum Helper {
    enum Colors {
        static let background = UIColor(red: 0.12, green: 0.13, blue: 0.15, alpha: 1.00)
        static let variable = UIColor(red: 0.96, green: 0.26, blue: 0.61, alpha: 1.00)
        static let variableName = UIColor(red: 0.24, green: 0.74, blue: 0.88, alpha: 1.00)
        static let type = UIColor(red: 0.85, green: 0.73, blue: 1.00, alpha: 1.00)
        static let typeName = UIColor(red: 0.45, green: 0.88, blue: 1.00, alpha: 1.00)
        static let number = UIColor(red: 1.00, green: 0.91, blue: 0.50, alpha: 1.00)
        static let string = UIColor(red: 0.98, green: 0.37, blue: 0.39, alpha: 1.00)
        static let brackets = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
        static let comments = UIColor(red: 0.50, green: 0.55, blue: 0.60, alpha: 1.00)
        static let ifElseCondition = UIColor(red: 0.40, green: 0.84, blue: 0.75, alpha: 1.00)
        static let pink = UIColor(red: 0.94, green: 0.20, blue: 0.85, alpha: 1.00)
        static let blue = UIColor(red: 0.54, green: 1.00, blue: 0.99, alpha: 1.00)
        static let red = UIColor(red: 0.95, green: 0.15, blue: 0.07, alpha: 1.00)
        static let orange = UIColor(red: 0.96, green: 0.69, blue: 0.10, alpha: 1.00)
        static let darkGray = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
        static let brightRed = UIColor(red: 0.87, green: 0.09, blue: 0.09, alpha: 1.00)
        static let darkPink = UIColor(red: 0.86, green: 0.47, blue: 1.00, alpha: 1.00)
        static let purple = UIColor(red: 0.15, green: 0.42, blue: 0.98, alpha: 1.00)
        static let test = UIColor(red: 0.32, green: 0.36, blue: 0.92, alpha: 1.00)
        static let white = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        
        static let linearGradientPinkBlue: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color(uiColor: Helper.Colors.pink), Color(uiColor: Helper.Colors.blue)]), startPoint: .bottomLeading, endPoint: .trailing)
        static let linearGradientRedOrange: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color(uiColor: Helper.Colors.red), Color(uiColor: Helper.Colors.orange)]), startPoint: .bottomLeading, endPoint: .trailing)
        static let linearGradientDarkGrayBrightRed: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color(uiColor: Helper.Colors.darkGray), Color(uiColor: Helper.Colors.brightRed)]), startPoint: .bottomLeading, endPoint: .trailing)
        static let linearGradientDarkPinkPurple: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color(uiColor:Helper.Colors.darkPink), Color(uiColor: Helper.Colors.purple)]), startPoint: .bottomLeading, endPoint: .topTrailing)
        
    }
}
