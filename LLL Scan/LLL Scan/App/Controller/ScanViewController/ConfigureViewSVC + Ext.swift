//
//  ConfigureViewPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit
import VisionKit

extension ScanVC: DataScannerViewControllerDelegate {
    override func configureView() {
        view.backgroundColor = .white
        
        title = "Scan"
        navigationController?.navigationBar.prefersLargeTitles = true
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
        
        dataScanner.view.addSubview(overlayViewForScanner.vc)
        
        NSLayoutConstraint.activate([
            overlayViewForScanner.vc.leadingAnchor.constraint(equalTo: dataScanner.view.leadingAnchor),
            overlayViewForScanner.vc.trailingAnchor.constraint(equalTo: dataScanner.view.trailingAnchor),
            overlayViewForScanner.vc.topAnchor.constraint(equalTo: dataScanner.view.topAnchor),
            overlayViewForScanner.vc.heightAnchor.constraint(equalTo: dataScanner.view.heightAnchor, multiplier: 0.4)
        ])
        
        
        present(dataScanner, animated: true)
        try? dataScanner.startScanning()
    }
    
    @objc func saveResult() {
        print("saveResult")
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
                resultLabel.label.text = "Не верный формат артикула!"
            }
        }

}


