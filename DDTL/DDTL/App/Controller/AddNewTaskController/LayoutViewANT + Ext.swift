//
//  LayoutView + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit

extension AddNewTaskViewController {
    
    override func layoutView() {
        let closeButton = closeButton.button
        let titleTextField = titleTextField.textField
        let descriptionTextField = descriptionTextField.textField
        
        //MARK: - Add Button
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 44),
            closeButton.heightAnchor.constraint(equalToConstant: 44),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
        
        //MARK: - Title TextField
        NSLayoutConstraint.activate([
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.heightAnchor.constraint(equalToConstant: 44),
            titleTextField.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 30),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
