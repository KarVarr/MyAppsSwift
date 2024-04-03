//
//  ConfigureButtonSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 03.04.2024.
//

import UIKit

extension ScanVC {
    func ConfigureButtonView() {
        buttonForAddNewTableView.button.setTitle("NEW SCAN", for: .normal)
        buttonForAddNewTableView.button.setTitleColor(.white, for: .normal)
        buttonForAddNewTableView.button.backgroundColor = .systemPink
        buttonForAddNewTableView.button.layer.cornerRadius = 22
        buttonForAddNewTableView.button.layer.shadowOffset = CGSize(width: 2, height: 1)
        buttonForAddNewTableView.button.layer.shadowOpacity = 0.6
    }
}
