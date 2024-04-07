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


