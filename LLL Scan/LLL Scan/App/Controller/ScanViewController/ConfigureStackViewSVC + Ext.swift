//
//  ConfigureStackViewSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 08.04.2024.
//

import UIKit

extension ScanVC {
    func configureStackViewSVC() {
        vStackForParsingData.stack.axis = .vertical
        vStackForParsingData.stack.alignment = .leading
        vStackForParsingData.stack.distribution = .fillEqually
        vStackForParsingData.stack.spacing = 10
    }
}
