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
        let verticalStackViewForLabelAndPointingFingerImageView = verticalStackViewForLabelAndPointingFingerImageView.stack
        let pointingFingerTitle = pointingFingerTitle.label
        let pointingFingerImageView = pointingFingerImageView.imageView
        
        //MARK: - Vertical StackView for Pointing Finger ImageView and Pointing Finger Title Label
        NSLayoutConstraint.activate([
            verticalStackViewForLabelAndPointingFingerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            verticalStackViewForLabelAndPointingFingerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackViewForLabelAndPointingFingerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verticalStackViewForLabelAndPointingFingerImageView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -10),
            
            pointingFingerTitle.topAnchor.constraint(equalTo: verticalStackViewForLabelAndPointingFingerImageView.topAnchor),
            pointingFingerTitle.centerXAnchor.constraint(equalTo: verticalStackViewForLabelAndPointingFingerImageView.centerXAnchor),
            
            pointingFingerImageView.topAnchor.constraint(equalTo: pointingFingerTitle.bottomAnchor),
            pointingFingerImageView.leadingAnchor.constraint(equalTo: verticalStackViewForLabelAndPointingFingerImageView.leadingAnchor),
            pointingFingerImageView.trailingAnchor.constraint(equalTo: verticalStackViewForLabelAndPointingFingerImageView.trailingAnchor),
            pointingFingerImageView.bottomAnchor.constraint(equalTo: verticalStackViewForLabelAndPointingFingerImageView.bottomAnchor)
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
