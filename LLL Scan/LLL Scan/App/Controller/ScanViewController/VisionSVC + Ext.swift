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
        switch item {
        case .text(let text):
            print("text : \(text)")
        default:
            print("🚫 Unexpected item.")
        }
    }
}
