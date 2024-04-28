//
//  ConfigureViewPDVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import Foundation

extension ProductDetailVC {
    override func configureView() {
        view.backgroundColor = .lightGray
        title = "Карточки товара"
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
