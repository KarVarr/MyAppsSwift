//
//  AddViewPDVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit

extension ProductDetailsVC {
    override func addViews() {
        let views: [UIView] = [
            customTableViewProductDetailsVC.table
        ]
        
        for addView in views {
            view.addSubview(addView)
        }
    }
}
