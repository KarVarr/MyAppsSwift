//
//  LayoutViewMVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 23.08.2024.
//

import UIKit

extension MainViewController {
    //MARK: - LAYOUT
    func layoutViewMVC() {
        let collection = uiCollectionView.customCollectionView
        
        //MARK: - UICollectionView
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
        
        //MARK: - Toolbar
        NSLayoutConstraint.activate([
            toolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            toolbar.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
