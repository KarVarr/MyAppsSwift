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
        
        //MARK: - Overlay View
        let overlayViews: [UIView] = [
            topRectangleViewForCloseIndication.vc,
            vStackForParsingTitleAndColor.stack,
            miniatureImageHM.imageView,
            resultLabel.label,
            saveButtonForScanner.button
        ]
        
        for addView in overlayViews {
            overlayViewForScanner.vc.addSubview(addView)
        }

        //MARK: - View Stack
        let vStackForParing = UIStackView(arrangedSubviews: [titleFromParsingLabel.label, colorFromParsingLabel.label])
        vStackForParsingTitleAndColor.stack.addArrangedSubview(vStackForParing)         
    }
}

