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
        
        
        saveOneProductButtonForScanner.button.layer.shadowOffset = CGSize(width: 1, height: 1)
        saveOneProductButtonForScanner.button.layer.shadowOpacity = 0.3
        saveOneProductButtonForScanner.button.configuration = .filled()
        saveOneProductButtonForScanner.button.configuration?.title = "Save"
        saveOneProductButtonForScanner.button.configuration?.baseBackgroundColor = .systemTeal
        saveOneProductButtonForScanner.button.configuration?.baseForegroundColor = .yellow
        saveOneProductButtonForScanner.button.configuration?.cornerStyle = .capsule
        saveOneProductButtonForScanner.button.configuration?.image = UIImage(systemName: "checkmark.shield.fill")
        saveOneProductButtonForScanner.button.configuration?.imagePlacement = .leading
        saveOneProductButtonForScanner.button.configuration?.imagePadding = 5
        saveOneProductButtonForScanner.button.addTarget(self, action: #selector(saveResult), for: .touchUpInside)
    }
    
}


