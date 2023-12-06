//
//  ConfigureWVC + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 06.12.2023.
//

import Foundation

extension WorldListViewController {
    override func configureView() {
        view.backgroundColor = Helper.Colors.beige
        
        setNavTitle(title: .worldListViewController)
    }
}
