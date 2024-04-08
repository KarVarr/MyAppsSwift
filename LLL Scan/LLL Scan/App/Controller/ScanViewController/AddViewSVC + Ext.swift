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
                    customTableViewScanVC.table,
                    buttonForAddNewTableView.button,
                    overlayViewForScanner.vc,
        ]
        
        for addView in views {
            view.addSubview(addView)
        }
        
        overlayViewForScanner.vc.addSubview(saveButtonForScanner.button)
        overlayViewForScanner.vc.addSubview(resultLabel.label)
        overlayViewForScanner.vc.addSubview(miniatureImageHM.imageView)
        overlayViewForScanner.vc.addSubview(titleFromParsingLabel.label)
        overlayViewForScanner.vc.addSubview(colorFromParsingLabel.label)
         
    }
}

