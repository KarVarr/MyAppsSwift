//
//  ConfigureLabelPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import Foundation

extension ScanVC {
    func configureLabels() {
        labelForHtml.label.text = "Hello"
        labelForHtml.label.numberOfLines = 0
        
        resultLabel.label.frame = CGRect(x: 0, y: videoPreviewLayer.frame.maxY, width: view.frame.width, height: 40)
        resultLabel.label.textAlignment = .center
        
    }
}
