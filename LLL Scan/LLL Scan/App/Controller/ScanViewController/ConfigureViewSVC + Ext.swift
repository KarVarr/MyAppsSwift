//
//  ConfigureViewPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import Foundation
import UIKit

extension ScanVC {
    override func configureView() {
        view.backgroundColor = .white
        overlayViewForScanner.vc.isHidden = true
    }
}


