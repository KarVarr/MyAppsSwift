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
        
        titleFromParsingLabel.label.numberOfLines = 0
        titleFromParsingLabel.label.lineBreakMode = .byWordWrapping
        
        materialFromParsingLabel.label.numberOfLines = 0
        materialFromParsingLabel.label.lineBreakMode = .byWordWrapping
        
        showCountOfProductsInArray.label.text = "0"
        showCountOfProductsInArray.label.backgroundColor = .tintColor
        showCountOfProductsInArray.label.textColor = .white
        showCountOfProductsInArray.label.layer.cornerRadius = 10
        showCountOfProductsInArray.label.textAlignment = .center
    }
}
