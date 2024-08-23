//
//  UIDevice + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 14.05.2023.
//


import UIKit


extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPhone10,3", "iPhone10,6":
            return "iPhone X"
        case "iPhone15,2":
            return "iPhone 14 Pro"
        case "iPhone15,3":
            return "iPhone 14 Pro Max"
        default:
            return identifier
        }
    }
}
