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
        buttonForAddNewTableView.button.setTitle("SCAN", for: .normal)
        buttonForAddNewTableView.button.setTitleColor(.white, for: .normal)
        buttonForAddNewTableView.button.backgroundColor = .systemPink
        buttonForAddNewTableView.button.layer.cornerRadius = 22
        buttonForAddNewTableView.button.layer.shadowOffset = CGSize(width: 1, height: 1)
        buttonForAddNewTableView.button.layer.shadowOpacity = 0.3
        
        buttonForAddNewTableView.button.addTarget(self, action: #selector(newScan), for: .touchUpInside)
        
        saveButtonForScanner.button.setTitle("SAVE", for: .normal)
        saveButtonForScanner.button.setTitleColor(.black, for: .normal)
        saveButtonForScanner.button.backgroundColor = .yellow
        saveButtonForScanner.button.layer.cornerRadius = 22
        saveButtonForScanner.button.layer.shadowOffset = CGSize(width: 1, height: 1)
        saveButtonForScanner.button.layer.shadowOpacity = 0.3
        saveButtonForScanner.button.addTarget(self, action: #selector(saveResult), for: .touchUpInside)
    }
    
}


