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
        
        lazy var dataScanner: DataScannerViewController = {
            let dataScanner = DataScannerViewController(recognizedDataTypes: [.text()], isHighFrameRateTrackingEnabled: true, isPinchToZoomEnabled: true, isHighlightingEnabled: true)
            dataScanner.delegate = self
            return dataScanner
        }()
        
        present(dataScanner, animated: true)
        try? dataScanner.startScanning()
    }
    
}


