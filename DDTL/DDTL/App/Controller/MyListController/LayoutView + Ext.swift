//
//  LayoutView + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit


extension MyListViewController {
    
    override func layoutView() {
        let addButton = addButton.button
        
        NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalToConstant: 88),
            addButton.heightAnchor.constraint(equalToConstant: 88),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
