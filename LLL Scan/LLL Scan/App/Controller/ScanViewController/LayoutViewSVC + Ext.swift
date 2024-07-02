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
        let emptyStateImageView = emptyStateImageView.imageView
        let miniatureImageHM = miniatureImageHM.imageView
        let vStackForParsingData = vStackForParsingData.stack
        let topRectangleViewForCloseIndication = topRectangleViewForCloseIndication.vc
        let showCountOfProductsInArray = showCountOfProductsInArray.label
        
        //MARK: - Custom Views
        NSLayoutConstraint.activate([
            topRectangleViewForCloseIndication.topAnchor.constraint(equalTo: overlayViewForScanner.topAnchor, constant: 5),
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
        
        //MARK: - Save buttons and Count label
        NSLayoutConstraint.activate([
            saveOneProductButtonForScanner.trailingAnchor.constraint(equalTo: overlayViewForScanner.trailingAnchor, constant: -10),
            saveOneProductButtonForScanner.bottomAnchor.constraint(equalTo: overlayViewForScanner.bottomAnchor, constant: -10),
            saveOneProductButtonForScanner.widthAnchor.constraint(equalTo: overlayViewForScanner.widthAnchor, multiplier: 0.4),
            saveOneProductButtonForScanner.heightAnchor.constraint(equalToConstant: 44),
            
            saveAllButtonForScanner.leadingAnchor.constraint(equalTo: overlayViewForScanner.leadingAnchor, constant: 10),
            saveAllButtonForScanner.bottomAnchor.constraint(equalTo: overlayViewForScanner.bottomAnchor, constant: -10),
            saveAllButtonForScanner.widthAnchor.constraint(equalTo: overlayViewForScanner.widthAnchor, multiplier: 0.4),
            saveAllButtonForScanner.heightAnchor.constraint(equalToConstant: 44),
            
            showCountOfProductsInArray.trailingAnchor.constraint(equalTo: saveOneProductButtonForScanner.leadingAnchor, constant: -5),
            showCountOfProductsInArray.leadingAnchor.constraint(equalTo: saveAllButtonForScanner.trailingAnchor, constant: 5),
            showCountOfProductsInArray.topAnchor.constraint(equalTo: saveAllButtonForScanner.topAnchor),
            showCountOfProductsInArray.bottomAnchor.constraint(equalTo: saveAllButtonForScanner.bottomAnchor),
            
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
            
            emptyStateImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyStateImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            emptyStateImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
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
