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
                case .scan: return UIImage(systemName: "list.bullet.clipboard")
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
                case .scan: return "Сканы"
                case .files: return "Файлы"
                }
            }
        }
    }
    //MARK: - KEYS
    enum Keys {
        static let scanVCCellKey = "scanVCCellKey"
        static let filesVCCellKey = "filesVCCellKey"
        static let listOfProducts = "filesVCCellKey"
        static let productDetails = "productDetailsCellKey"
        static let productDetailsCellHeader = "productDetailsCellHeaderKey"
    }
    
    
    //MARK: - Fonts
    enum Fonts {
        static func dynamicFontSize(_ fontSize: CGFloat) -> CGFloat {
            let screenWidth = UIScreen.main.bounds.size.width
            let calculatedFontSize = screenWidth / 375 * fontSize
            return calculatedFontSize
        }
    }
}
