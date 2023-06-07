//
//  Helpers.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 06.06.2023.
//

import Foundation

struct Helpers {
    enum String {
        static let alertMessage = """
                Make sure that vibration and haptics are enabled in your device settings:
        
        1) |Setting -> Sounds & Haptics| and switch on 'Vibrate on Ring', 'Vibrate on Silent', and 'System Haptics'
        
        2) |Setting -> Accessibility -> Touch| and switch on 'Vibration'
        """
        
        static let pressButtonTextTitle = "Press the button"
        static let pressButtonTextSubtitle = "to start massage"
        static let mainTitle = "Pulse Ride"
    }
}
