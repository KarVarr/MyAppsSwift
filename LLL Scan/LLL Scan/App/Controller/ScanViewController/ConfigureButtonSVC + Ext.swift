//
//  ConfigureButtonSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 03.04.2024.
//

import UIKit
import VisionKit

extension ScanVC {
    func configureButtonView() {
        buttonForAddNewTableView.button.layer.shadowOffset = CGSize(width: 1, height: 1)
        buttonForAddNewTableView.button.layer.shadowOpacity = 0.3
        buttonForAddNewTableView.button.configuration = .filled()
        buttonForAddNewTableView.button.configuration?.baseBackgroundColor = .systemTeal
        buttonForAddNewTableView.button.configuration?.baseForegroundColor = .yellow
        buttonForAddNewTableView.button.configuration?.cornerStyle = .capsule
        buttonForAddNewTableView.button.configuration?.image = UIImage(systemName: "barcode.viewfinder")
        buttonForAddNewTableView.button.configuration?.imagePlacement = .all
        buttonForAddNewTableView.button.addTarget(self, action: #selector(newScan), for: .touchUpInside)
        
        
        saveButtonForScanner.button.layer.shadowOffset = CGSize(width: 1, height: 1)
        saveButtonForScanner.button.layer.shadowOpacity = 0.3
        saveButtonForScanner.button.configuration = .filled()
        saveButtonForScanner.button.configuration?.title = "Save"
        saveButtonForScanner.button.configuration?.baseBackgroundColor = .systemTeal
        saveButtonForScanner.button.configuration?.baseForegroundColor = .yellow
        saveButtonForScanner.button.configuration?.cornerStyle = .capsule
        saveButtonForScanner.button.configuration?.image = UIImage(systemName: "checkmark.shield.fill")
        saveButtonForScanner.button.configuration?.imagePlacement = .leading
        saveButtonForScanner.button.configuration?.imagePadding = 5
        saveButtonForScanner.button.addTarget(self, action: #selector(saveResult), for: .touchUpInside)
    }
    
}


