//
//  AddViewLPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit

extension ListOfProductsVC {
    override func addViews() {
        let views: [UIView] = [
            customTableViewProductDetailVC.table,
        ]
        
        for addView in views {
            view.addSubview(addView)
        }
    }
}
