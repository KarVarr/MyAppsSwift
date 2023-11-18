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
        let pointingFingerTop = pointingFingerLabelTop.label
        let pointingFingerMiddle = pointingFingerLabelMiddle.label
        let pointingFingerBottom = pointingFingerLabelBottom.label
        let pointingFingerImageView = pointingFingerImageView.imageView
        

        
        
        //MARK: - PointingFinger Labels
        NSLayoutConstraint.activate([
            pointingFingerTop.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pointingFingerTop.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            pointingFingerMiddle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pointingFingerMiddle.topAnchor.constraint(equalTo: pointingFingerTop.bottomAnchor, constant: 10),
            
            pointingFingerBottom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pointingFingerBottom.topAnchor.constraint(equalTo: pointingFingerMiddle.bottomAnchor, constant: 10),
        ])
        
        //MARK: - PointingFinger ImageView
        NSLayoutConstraint.activate([
            pointingFingerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pointingFingerImageView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: 30),
            pointingFingerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pointingFingerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
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
