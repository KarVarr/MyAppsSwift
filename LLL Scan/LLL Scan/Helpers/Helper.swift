//
//  Helper.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import UIKit

enum Helper {
    //MARK: - IMAGES FOR TABBAR
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
}
