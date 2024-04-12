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
        let saveButtonForScanner = saveButtonForScanner.button
        let overlayViewForScanner = overlayViewForScanner.vc
        let resultLabel = resultLabel.label
        let miniatureImageHM = miniatureImageHM.imageView
        let vStackForParsingData = vStackForParsingData.stack
        let titleFromParsingLabel = titleFromParsingLabel.label
        let colorFromParsingLabel = colorFromParsingLabel.label
        let topRectangleViewForCloseIndication = topRectangleViewForCloseIndication.vc
        
        
        //MARK: - Custom Views
        NSLayoutConstraint.activate([
            topRectangleViewForCloseIndication.topAnchor.constraint(equalTo: overlayViewForScanner.topAnchor, constant: 10),
            topRectangleViewForCloseIndication.centerXAnchor.constraint(equalTo: overlayViewForScanner.centerXAnchor),
            topRectangleViewForCloseIndication.widthAnchor.constraint(equalToConstant: 30),
            topRectangleViewForCloseIndication.heightAnchor.constraint(equalToConstant: 7),
        ])
        
        //MARK: - Button for add new table view for scanning
        NSLayoutConstraint.activate([
            buttonForAddNewTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonForAddNewTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonForAddNewTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            buttonForAddNewTableView.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        NSLayoutConstraint.activate([
            saveButtonForScanner.centerXAnchor.constraint(equalTo: overlayViewForScanner.centerXAnchor),
            saveButtonForScanner.bottomAnchor.constraint(equalTo: overlayViewForScanner.bottomAnchor, constant: -20),
            saveButtonForScanner.widthAnchor.constraint(equalTo: overlayViewForScanner.widthAnchor, multiplier: 0.2),
            saveButtonForScanner.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        //MARK: - Custom view for scan view
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: overlayViewForScanner.safeAreaLayoutGuide.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: overlayViewForScanner.topAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: overlayViewForScanner.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: overlayViewForScanner.trailingAnchor, constant: -20),
        ])
        
        //MARK: - INSIDE CUSTOM SCAN VIEW - Image from parsing/ miniature H&M product image
        NSLayoutConstraint.activate([
            miniatureImageHM.centerXAnchor.constraint(equalTo: overlayViewForScanner.centerXAnchor),
            miniatureImageHM.centerYAnchor.constraint(equalTo: overlayViewForScanner.centerYAnchor),
            miniatureImageHM.widthAnchor.constraint(equalToConstant: 180),
            miniatureImageHM.heightAnchor.constraint(equalToConstant: 230),
        ])
        
        //MARK: - INSIDE CUSTOM SCAN VIEW - labels from parsing
        NSLayoutConstraint.activate([
            vStackForParsingData.leadingAnchor.constraint(equalTo: overlayViewForScanner.leadingAnchor, constant: 20),
            vStackForParsingData.trailingAnchor.constraint(equalTo: overlayViewForScanner.trailingAnchor, constant: -20),
            vStackForParsingData.bottomAnchor.constraint(equalTo: saveButtonForScanner.topAnchor, constant: 10),
            vStackForParsingData.topAnchor.constraint(equalTo: miniatureImageHM.bottomAnchor, constant: 20),        
        ])
    }
}
