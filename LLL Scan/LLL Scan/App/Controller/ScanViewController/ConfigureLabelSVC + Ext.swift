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
        resultLabel.label.font = UIFont(name: "AppleSDGothicNeo_Bold", size: Helper.Fonts.dynamicFontSize(36))
        resultLabel.label.numberOfLines = 0
        
        titleFromParsingLabel.label.numberOfLines = 0
        titleFromParsingLabel.label.lineBreakMode = .byWordWrapping
        titleFromParsingLabel.label.font = UIFont(name: "AppleSDGothicNeo_Bold", size: Helper.Fonts.dynamicFontSize(14))
        
        materialFromParsingLabel.label.numberOfLines = 0
        materialFromParsingLabel.label.lineBreakMode = .byWordWrapping
        materialFromParsingLabel.label.font = UIFont(name: "AppleSDGothicNeo_Bold", size: Helper.Fonts.dynamicFontSize(14))
        
        colorFromParsingLabel.label.numberOfLines = 0
        colorFromParsingLabel.label.lineBreakMode = .byWordWrapping
        colorFromParsingLabel.label.font = UIFont(name: "AppleSDGothicNeo_Bold", size: Helper.Fonts.dynamicFontSize(14))
        
        showCountOfProductsInArray.label.text = "0"
        showCountOfProductsInArray.label.textColor = .black
        showCountOfProductsInArray.label.textAlignment = .center
        showCountOfProductsInArray.label.font = UIFont(name: "AppleSDGothicNeo_Bold", size: Helper.Fonts.dynamicFontSize(20))
    }
}
