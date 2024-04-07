//
//  AddViewPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit

extension ScanVC {
    override func addViews() {
        let views: [UIView] = [
                    labelForHtml.label,
                    imageForHtml.imageView,
                    customTableViewScanVC.table,
                    buttonForAddNewTableView.button
        ]
        
        for addView in views {
            view.addSubview(addView)
        }
         
    }
}

