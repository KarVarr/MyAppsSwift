//
//  ConfigureButtonSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 03.04.2024.
//

import UIKit
import VisionKit

extension ScanVC {
    func configureButtonView() {
        buttonForAddNewTableView.button.setTitle("NEW SCAN", for: .normal)
        buttonForAddNewTableView.button.setTitleColor(.white, for: .normal)
        buttonForAddNewTableView.button.backgroundColor = .systemPink
        buttonForAddNewTableView.button.layer.cornerRadius = 22
        buttonForAddNewTableView.button.layer.shadowOffset = CGSize(width: 2, height: 1)
        buttonForAddNewTableView.button.layer.shadowOpacity = 0.6
        
        buttonForAddNewTableView.button.addTarget(self, action: #selector(newScan), for: .touchUpInside)
    }
    
    @objc func newScan() {
        guard scannerAvailable == true else {
            print(" Error: Scanner is not available for usage. Please check settings")
            return
        }
        
        let dataScanner = DataScannerViewController(recognizedDataTypes: [.text()],
                                                    isHighFrameRateTrackingEnabled: true,
                                                    isPinchToZoomEnabled: true,
                                                    isHighlightingEnabled: true
        )
        dataScanner.delegate = self
        
        
        
//        dataScanner.addChild(overlayViewForScanner.vc)
        dataScanner.view.addSubview(overlayViewForScanner.vc)
        
        NSLayoutConstraint.activate([
            overlayViewForScanner.vc.leadingAnchor.constraint(equalTo: dataScanner.view.leadingAnchor),
            overlayViewForScanner.vc.trailingAnchor.constraint(equalTo: dataScanner.view.trailingAnchor),
            overlayViewForScanner.vc.bottomAnchor.constraint(equalTo: dataScanner.view.bottomAnchor),
            overlayViewForScanner.vc.heightAnchor.constraint(equalTo: dataScanner.view.heightAnchor, multiplier: 0.5)
        ])
        
        saveButtonForScanner.button.setTitle("Save", for: .normal)
        saveButtonForScanner.button.addTarget(self, action: #selector(saveResult), for: .touchUpInside)
        
        
        

        
        present(dataScanner, animated: true)
        try? dataScanner.startScanning()
    }
    
    
    @objc func saveResult() {
        
    }
    
    
}


