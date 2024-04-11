//
//  ConfigureViewCustom.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 07.04.2024.
//

import UIKit


extension ScanVC {
    func configureViewCustom() {
        overlayViewForScanner.vc.backgroundColor = .white
        overlayViewForScanner.vc.layer.cornerRadius = 30
        overlayViewForScanner.vc.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        overlayViewForScanner.vc.isHidden = true
    }
}
