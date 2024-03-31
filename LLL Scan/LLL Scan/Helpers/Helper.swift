//
//  Helper.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import UIKit

enum Helper {
    //MARK: - IMAGES
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .scan: return UIImage(systemName: "barcode.viewfinder")
                case .files: return UIImage(systemName: "doc")
                }
            }
        }
    }
    
    //MARK: - STRINGS
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String? {
                switch tab {
                case .scan: return "Scan"
                case .files: return "Files"
                }
            }
        }
    }
    //MARK: - KEYS
    enum Keys {
        static let scanVCCellKey = "scanVCCellKey"
    }
}
