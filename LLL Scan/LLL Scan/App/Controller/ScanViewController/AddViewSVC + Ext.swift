//
//  AddViewPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit

extension ScanVC {
    override func addViews() {
        //MARK: - View
        addView(views: [labelForHtml.label,
                        customTableViewScanVC.table,
                        buttonForAddNewTableView.button,
                        overlayViewForScanner.vc], 
                uiView: view)
        
        //MARK: - Overlay View
        addView(views: [topRectangleViewForCloseIndication.vc,
                        vStackForParsingTitleAndColor.stack,
                        miniatureImageHM.imageView,
                        resultLabel.label,
                        saveButtonForScanner.button], 
                uiView: overlayViewForScanner.vc)

        //MARK: - View Stack
        let vStackForParing = UIStackView(arrangedSubviews: [titleFromParsingLabel.label, colorFromParsingLabel.label])
        vStackForParsingTitleAndColor.stack.addArrangedSubview(vStackForParing)         
    }
    
    private func addView(views: [UIView], uiView: UIView) {
        for addView in views {
            uiView.addSubview(addView)
        }
    }
}

