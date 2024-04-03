//
//  ConfigureButtonSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 03.04.2024.
//

import UIKit

extension ScanVC {
    func ConfigureButtonSVC() {
        buttonForAddNewTableView.button.setTitle("+ New sheet", for: .normal)
        buttonForAddNewTableView.button.setTitleColor(.black, for: .normal)
        buttonForAddNewTableView.button.backgroundColor = .systemPink
        buttonForAddNewTableView.button.layer.cornerRadius = 20
    }
}
