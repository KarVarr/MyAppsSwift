//
//  ConfigureStackViewSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 08.04.2024.
//

import Foundation

extension ScanVC {
    func configureStackViewSVC() {
        vStackForParsingTitleAndColor.stack.axis = .vertical
        vStackForParsingTitleAndColor.stack.alignment = .leading
        vStackForParsingTitleAndColor.stack.distribution = .equalCentering
    }
}
