//
//  LayoutViewPVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit

extension ScanVC {
    override func layoutView() {
        let buttonForAddNewTableView = buttonForAddNewTableView.button
        let saveOneProductButtonForScanner = saveOneProductButtonForScanner.button
        let saveAllButtonForScanner = saveAllButtonForScanner.button
        let overlayViewForScanner = overlayViewForScanner.vc
        let resultLabel = resultLabel.label
        let miniatureImageHM = miniatureImageHM.imageView
        let vStackForParsingData = vStackForParsingData.stack
        let topRectangleViewForCloseIndication = topRectangleViewForCloseIndication.vc
        
        
        //MARK: - Custom Views
        NSLayoutConstraint.activate([
            topRectangleViewForCloseIndication.topAnchor.constraint(equalTo: overlayViewForScanner.safeAreaLayoutGuide.topAnchor),
            topRectangleViewForCloseIndication.centerXAnchor.constraint(equalTo: overlayViewForScanner.centerXAnchor),
            topRectangleViewForCloseIndication.widthAnchor.constraint(equalToConstant: 30),
            topRectangleViewForCloseIndication.heightAnchor.constraint(equalToConstant: 7),
        ])
        
        //MARK: - Button for add new table view for scanning
        NSLayoutConstraint.activate([
            buttonForAddNewTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            buttonForAddNewTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonForAddNewTableView.widthAnchor.constraint(equalToConstant: 60),
            buttonForAddNewTableView.heightAnchor.constraint(equalToConstant: 60),
        ])
        //MARK: - Save button
        NSLayoutConstraint.activate([
//            saveOneProductButtonForScanner.centerXAnchor.constraint(equalTo: overlayViewForScanner.centerXAnchor),
            saveOneProductButtonForScanner.leadingAnchor.constraint(equalTo: overlayViewForScanner.leadingAnchor, constant: 20),
            saveOneProductButtonForScanner.bottomAnchor.constraint(equalTo: overlayViewForScanner.bottomAnchor, constant: -20),
            saveOneProductButtonForScanner.widthAnchor.constraint(equalTo: overlayViewForScanner.widthAnchor, multiplier: 0.3),
            saveOneProductButtonForScanner.heightAnchor.constraint(equalToConstant: 44),
            
            saveAllButtonForScanner.trailingAnchor.constraint(equalTo: overlayViewForScanner.trailingAnchor, constant: -20),
            saveAllButtonForScanner.bottomAnchor.constraint(equalTo: overlayViewForScanner.bottomAnchor, constant: -20),
            saveAllButtonForScanner.widthAnchor.constraint(equalTo: overlayViewForScanner.widthAnchor, multiplier: 0.2),
            saveAllButtonForScanner.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        //MARK: - Custom view for scan view
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: overlayViewForScanner.safeAreaLayoutGuide.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: overlayViewForScanner.safeAreaLayoutGuide.topAnchor, constant: 15),
            resultLabel.leadingAnchor.constraint(equalTo: overlayViewForScanner.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: overlayViewForScanner.trailingAnchor, constant: -20),
        ])
        
        //MARK: - INSIDE CUSTOM SCAN VIEW - Image from parsing/ miniature H&M product image
        NSLayoutConstraint.activate([
            miniatureImageHM.centerXAnchor.constraint(equalTo: overlayViewForScanner.centerXAnchor),
            miniatureImageHM.centerYAnchor.constraint(equalTo: overlayViewForScanner.centerYAnchor),
            miniatureImageHM.widthAnchor.constraint(equalToConstant: 150),
            miniatureImageHM.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        //MARK: - INSIDE CUSTOM SCAN VIEW - labels from parsing
        NSLayoutConstraint.activate([
            vStackForParsingData.bottomAnchor.constraint(equalTo: saveOneProductButtonForScanner.topAnchor, constant: -10),
            vStackForParsingData.topAnchor.constraint(equalTo: miniatureImageHM.bottomAnchor, constant: 10),
            vStackForParsingData.trailingAnchor.constraint(equalTo: overlayViewForScanner.trailingAnchor, constant: -10),
            vStackForParsingData.leadingAnchor.constraint(equalTo: overlayViewForScanner.leadingAnchor, constant: 10),
        ])
    }
}
