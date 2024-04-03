//
//  ConfigureViewFVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 03.04.2024.
//

import UIKit

extension FilesVC {
    override func configureView() {
        view.backgroundColor = .orange
        
        title = "Files"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
