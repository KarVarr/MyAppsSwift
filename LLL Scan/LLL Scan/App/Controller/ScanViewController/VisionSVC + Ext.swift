//
//  VisionSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 07.04.2024.
//

import Foundation
import VisionKit

extension ScanVC: DataScannerViewControllerDelegate {
    func configureVisionKitSVC() {
        
    }
    func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
        guard case .text(let text) = item else { return }
        
        let parts = text.transcript.components(separatedBy: " ")
        if parts.count == 4 {
            let result = "\(parts[1])\(parts[2])"
            print("Result article : \(result)")
        } else {
            print("Error: Not such code")
        }
    }
}
