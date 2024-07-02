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
                        emptyStateImageView.imageView,
                        buttonForAddNewTableView.button,
                        overlayViewForScanner.vc
                       ],
                uiView: view)
        
        //MARK: - Overlay View
        addView(views: [topRectangleViewForCloseIndication.vc,
                        vStackForParsingData.stack,
                        miniatureImageHM.imageView,
                        resultLabel.label,
                        saveOneProductButtonForScanner.button,
                        saveAllButtonForScanner.button,
                        showCountOfProductsInArray.label,
                       ],
                uiView: overlayViewForScanner.vc)
        
        //MARK: - View Stack
        vStackForParsingData.stack.addArrangedSubview(titleFromParsingLabel.label)
        vStackForParsingData.stack.addArrangedSubview(colorFromParsingLabel.label)
        vStackForParsingData.stack.addArrangedSubview(materialFromParsingLabel.label)
    }
    
    private func addView(views: [UIView], uiView: UIView) {
        for addView in views {
            uiView.addSubview(addView)
        }
    }
}

