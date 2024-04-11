//
//  ConfigureLabelPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit

extension ScanVC {
    func configureLabels() {
        labelForHtml.label.text = "Hello"
        labelForHtml.label.numberOfLines = 0
        
        resultLabel.label.textColor = .black
        resultLabel.label.font = UIFont(name: "AppleSDGothicNeo_Bold", size: 36)
        resultLabel.label.numberOfLines = 0
    }
}
