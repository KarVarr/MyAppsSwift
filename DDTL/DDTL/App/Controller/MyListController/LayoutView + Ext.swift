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
        let pointingFingerImageView = pointingFingerImageView.imageView
        
        //MARK: - Pointing Finger ImageView
        NSLayoutConstraint.activate([
            pointingFingerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pointingFingerImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pointingFingerImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            pointingFingerImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
        ])
        
        
        //MARK: - Add Button
        NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalToConstant: 88),
            addButton.heightAnchor.constraint(equalToConstant: 88),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
