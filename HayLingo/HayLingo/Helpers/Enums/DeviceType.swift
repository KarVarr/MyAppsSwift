//
//  DeviceType.swift
//  HayLingo
//
//  Created by Karen Vardanian on 06.01.2025.
//

import Foundation
import UIKit

// MARK: - Device Type Detection
enum DeviceType {
    case phone, pad
    
    static var current: DeviceType {
        UIDevice.current.userInterfaceIdiom == .pad ? .pad : .phone
    }
}
