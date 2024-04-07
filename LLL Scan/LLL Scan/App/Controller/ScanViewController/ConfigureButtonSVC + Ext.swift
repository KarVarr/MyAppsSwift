//
//  ConfigureButtonSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 03.04.2024.
//

import UIKit
import VisionKit

extension ScanVC: DataScannerViewControllerDelegate {
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
        
        
        
        
        
        present(dataScanner, animated: true)
        try? dataScanner.startScanning()
    }
    
    func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            guard case .text(let text) = item else { return }
            
            let parts = text.transcript.components(separatedBy: " ")
            if parts.count == 4 {
                let result = "\(parts[1])\(parts[2])"
                print("Result article : \(result)")
                resultLabel.label.text = result
            } else {
                print("Error: Not such code")
                resultLabel.label.text = "Error: Invalid code format"
            }
        }

    
    
}


