//
//  AddViewFVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 03.04.2024.
//

import UIKit

extension FilesVC {
    override func addViews() {
        let views: [UIView] = [
            customTableViewFilesVC.table,
        ]
        
        for addView in views {
            view.addSubview(addView)
        }
    }
}
