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
        
        //MARK: - Button for add new table view for scanning
        NSLayoutConstraint.activate([
            buttonForAddNewTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonForAddNewTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonForAddNewTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            buttonForAddNewTableView.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        NSLayoutConstraint.activate([
            saveButtonForScanner.centerXAnchor.constraint(equalTo: overlayViewForScanner.centerXAnchor),
            saveButtonForScanner.bottomAnchor.constraint(equalTo: overlayViewForScanner.bottomAnchor, constant: -10),
        ])
        
        //MARK: - Custom view for scan view
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: overlayViewForScanner.safeAreaLayoutGuide.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: overlayViewForScanner.topAnchor, constant: 10),
            resultLabel.leadingAnchor.constraint(equalTo: overlayViewForScanner.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: overlayViewForScanner.trailingAnchor, constant: -10),
        ])
        
    }
}
