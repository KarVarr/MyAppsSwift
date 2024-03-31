//
//  AddViewPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit

extension ScanVC {
    override func addViews() {
        view.addSubview(labelForHtml.label)
        view.addSubview(imageForHtml.imageView)
    }
}

